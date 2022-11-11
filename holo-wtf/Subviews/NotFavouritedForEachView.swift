//
//  NotFavouritedForEachView.swift
//  holo-wtf
//
//
//

import SwiftUI

/// A view that `ForEach` a list of non-favourited videos.
///
/// The logic that filters non-favourited videos is here. The logic that filters generation is also here. 
/// This view accepts another `View` for what the video will be fit into. 
struct NotFavouritedForEachView<Content: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @AppStorage("generationListSelection") var generationListSelection = Set(Generation.allCases)
    
    @EnvironmentObject var viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        let favouritedFilteredVideo = viewModel.videoList.filter { video in
            !favourited.contains(where: { video.channel.id == $0 })
        }
        
        let generationFilteredVideo = favouritedFilteredVideo.filter { video in
            generationListSelection.contains(video.channel.talent?.inGeneration ?? .other)
        }
        
        ForEach(generationFilteredVideo, id: \.self) { live in
            cellView(live)
        }
    }
}

//struct NotFavouritedForEachView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotFavouritedForEachView()
//    }
//}
