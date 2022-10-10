//
//  SectionedNotFavouritedForEachView.swift
//  holo-wtf
//
//
//

import SwiftUI

/// A view that `ForEach` a list of non-favourited videos, but put the videos into generation categories.
///
/// The logic that filters non-favourited videos and the logic that determines the category are stored here.
/// This view accepts another `View` for what the video will be fit into.
struct SectionedNotFavouritedForEachView<Content: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage("generationListSelection") var generationListSelection = Set(hololiveGenerations.allCases)
    @AppStorage("generationListOrder") var generationListOrder = hololiveGenerations.allCases
    
    @EnvironmentObject var viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        let filteredVideos = viewModel.videoList.filter { video in
            !favourited.contains(where: { video.channel.id == $0 })
        }
        
        let groupedDictionary = Dictionary<hololiveGenerations, [LiveVideo]>(grouping: filteredVideos, by: { $0.channel.talent?.inGeneration ?? .other })
        let filteredGenerationListOrder = generationListOrder.filter { generation in
            generationListSelection.contains(generation)
        }
        
        let filteredGroupedDictionary = groupedDictionary.filter { element in
            filteredGenerationListOrder.contains(element.key)
        }
        
        let sortedFilteredGroupedDictionary = filteredGroupedDictionary.sorted {
            let orderOfFirst = filteredGenerationListOrder.firstIndex(of: $0.key) ?? 0
            let orderOfSecond = filteredGenerationListOrder.firstIndex(of: $1.key) ?? 0
            
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
