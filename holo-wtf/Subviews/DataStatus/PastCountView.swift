//
//  PastCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastCountView: View {
    @AppStorage("generationListSelection") var generationListSelection = Set(Generation.allCases)
    
    @EnvironmentObject var past: VideoViewModel
    
    var body: some View {
        let filteredVideoCount = past.videoList.filter { video in
            !generationListSelection.contains(video.channel.talent?.inGeneration ?? .other)
        }.count
        
        if filteredVideoCount == 0 {
            Text("PAST_VIEW_CURRENT_COUNT \(past.videoList.count)")
                .foregroundColor(.secondary)
        } else {
            Text("PAST_VIEW_CURRENT_COUNT \(past.videoList.count) \(filteredVideoCount)")
                .foregroundColor(.secondary)
        }
    }
}

struct PastCountView_Previews: PreviewProvider {
    static var previews: some View {
        PastCountView()
    }
}
