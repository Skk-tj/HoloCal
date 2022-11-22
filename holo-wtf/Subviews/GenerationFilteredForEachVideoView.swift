//
//  NotFavouritedForEachView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct GenerationFilteredForEachVideoView<Content: View>: View {
    @AppStorage("generationListSelection") var generationListSelection = Set(Generation.allCases)
    
    @EnvironmentObject var viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        let generationFilteredVideo = viewModel.videoList.filter { video in
            generationListSelection.contains(video.channel.talent?.inGeneration ?? .other)
        }
        
        ForEach(generationFilteredVideo, id: \.self) { live in
            cellView(live)
        }
    }
}
