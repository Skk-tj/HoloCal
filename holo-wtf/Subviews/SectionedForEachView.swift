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
    
    @AppStorage("hololiveGenerationListOrder") var hololiveGenerationListOrder = agencyEnumToGenerations[AgencyEnum.hololive]!
    @AppStorage("nijisanjiGenerationListOrder") var nijisanjiGenerationListOrder = agencyEnumToGenerations[AgencyEnum.nijisanji]!
    @AppStorage("reactGenerationListOrder") var reactGenerationListOrder = agencyEnumToGenerations[AgencyEnum.react]!
    
    @EnvironmentObject var viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        let groupedDictionary = OrderedDictionary<Generation, [LiveVideo]>(grouping: viewModel.videoList, by: { $0.channel.talent?.inGeneration ?? .other })
        
        let filteredGroupedDictionary = groupedDictionary.filter { element in
            generationListSelection.contains(element.key)
        }
        
        let sortedFilteredGroupedDictionary = filteredGroupedDictionary.sorted {
            let orderOfFirst = hololiveGenerationListOrder.firstIndex(of: $0.key) ?? nijisanjiGenerationListOrder.firstIndex(of: $0.key) ?? reactGenerationListOrder.firstIndex(of: $0.key) ?? 0
            let orderOfSecond = hololiveGenerationListOrder.firstIndex(of: $1.key) ?? nijisanjiGenerationListOrder.firstIndex(of: $1.key) ?? reactGenerationListOrder.firstIndex(of: $1.key) ?? 0
            
            return orderOfFirst < orderOfSecond
        }
        
        ForEach(sortedFilteredGroupedDictionary, id: \.key) { key, value in
            Section(header: Text(key.getLocalizedName())) {
                ForEach(value, id: \.self) { live in
                    cellView(live)
                }
            }
        }
    }
}

//struct SectionedNotFavouritedForEachView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionedNotFavouritedForEachView()
//    }
//}
