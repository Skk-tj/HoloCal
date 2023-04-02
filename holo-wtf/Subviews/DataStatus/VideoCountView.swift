//
//  VideoCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoCountView: View {
    @AppStorage("generationListSelection") var generationListSelection = Set(Generation.allCases)
    @AppStorage(UserDefaultKeys.upcomingLookAhead) var upcomingLookAhead = 48
    
    @EnvironmentObject var video: VideoViewModel
    
    let videoType: VideoType
    
    var body: some View {
        let filteredVideoCount = video.videoList.filter { video in
            !generationListSelection.contains(video.channel.talent?.inGeneration ?? .other)
        }.count
        
        if filteredVideoCount == 0 {
            switch videoType {
            case .live:
                Text("LIVE_VIEW_CURRENT_COUNT \(video.videoList.count)")
                    .foregroundColor(.secondary)
            case .upcoming:
                Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(video.videoList.count) \(upcomingLookAhead)")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            case .past:
                Text("PAST_VIEW_CURRENT_COUNT \(video.videoList.count)")
                    .foregroundColor(.secondary)
            }
        } else {
            switch videoType {
            case .live:
                Text("LIVE_VIEW_CURRENT_COUNT \(video.videoList.count) \(filteredVideoCount)")
                    .foregroundColor(.secondary)
            case .upcoming:
                Text("UPCOMING_VIEW_STREAM_COUNT_IN_HOURS \(video.videoList.count) \(upcomingLookAhead) \(filteredVideoCount)")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            case .past:
                Text("PAST_VIEW_CURRENT_COUNT \(video.videoList.count) \(filteredVideoCount)")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct VideoCountView_Previews: PreviewProvider {
    static var previews: some View {
        VideoCountView(videoType: .live)
        VideoCountView(videoType: .upcoming)
        VideoCountView(videoType: .past)
    }
}
