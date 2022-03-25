//
//  LiveViewModel.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import Foundation
import OSLog

@MainActor
class LiveViewModel: VideoListViewModel {
    func getLive() async {
        await getVideos(url: "https://api.holotools.app/v1/live") { liveResponse in
            self.videoList = liveResponse.live
            self.videoList.sort(by: {$0.liveStart ?? Date() < $1.liveStart ?? Date()})
        }
    }
}
