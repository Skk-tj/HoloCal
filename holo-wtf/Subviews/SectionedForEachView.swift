//
//  SectionedNotFavouritedForEachView.swift
//  holo-wtf
//
//
//

import SwiftUI
import OrderedCollections

/// A view that `ForEach` a list of non-favourited videos, but put the videos into generation categories.
///
/// The logic that filters non-favourited videos and the logic that determines the category are stored here.
/// This view accepts another `View` for what the video will be fit into.
struct SectionedForEachView<Content: View>: View {
    @AppStorage("generationListSelection") var generationListSelection = Set(Generation.allCases)
    @AppStorage("generationListOrderNew") var generateListOrder: Data = (try? JSONEncoder().encode(agencyEnumToGenerations)) ?? Data()
    
    @EnvironmentObject var viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        let groupedDictionary = OrderedDictionary<Generation, [LiveVideo]>(grouping: viewModel.videoList, by: { $0.channel.talent?.inGeneration ?? .other })
        
        let filteredGroupedDictionary = groupedDictionary.filter { element in
            generationListSelection.contains(element.key)
        }
        
        let sortedFilteredGroupedDictionary = filteredGroupedDictionary.sorted { kv1, kv2 in
            let orderOfFirst: Int = AgencyEnum.allCases.map {
                getGenerationOrderList(from: generateListOrder, agency: $0).firstIndex(of: kv1.key) ?? -1
            }.first { $0 != -1 } ?? 0
            
            let orderOfSecond: Int = AgencyEnum.allCases.map {
                getGenerationOrderList(from: generateListOrder, agency: $0).firstIndex(of: kv2.key) ?? -1
            }.first { $0 != -1 } ?? 0
            
            return orderOfFirst < orderOfSecond
        }
        
        ForEach(sortedFilteredGroupedDictionary, id: \.key) { key, value in
            Section(content: {
                ForEach(value, id: \.self) { live in
                    cellView(live)
                }
            }, header: {
                Text(key.getLocalizedName())
            })
        }
    }
}
