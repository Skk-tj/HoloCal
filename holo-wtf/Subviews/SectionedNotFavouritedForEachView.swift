//
//  SectionedNotFavouritedForEachView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-29.
//

import SwiftUI

/// A view that `ForEach` a list of non-favourited videos, but put the videos into generation categories.
///
/// The logic that filters non-favourited videos and the logic that determines the category are stored here.
/// This view accepts another `View` for what the video will be fit into.
struct SectionedNotFavouritedForEachView<Content: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    let viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        let filteredVideos = viewModel.videoList.filter { video in
            !favourited.contains(where: { video.channel.id == $0 })
        }
        
        let groupedDictionary = Dictionary<GenerationEnum, [LiveVideo]>(grouping: filteredVideos, by: { $0.channel.talent.inGeneration })
        
        ForEach(groupedDictionary.sorted(by: { $0.key.rawValue < $1.key.rawValue }), id: \.key) { key, value in
            Section(header: Text("\(Locale.current.languageCode == "ja" ? generationToName[key]![.ja]! : generationToName[key]![.en]!)")) {
                ForEach(value, id: \.self) { live in
                    cellView(live)
                }
            }
            .headerProminence(.increased)
        }
    }
}

//struct SectionedNotFavouritedForEachView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionedNotFavouritedForEachView()
//    }
//}
