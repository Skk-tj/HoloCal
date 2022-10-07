//
//  NewLiveViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import MusicKit
import OSLog

@MainActor
class LiveViewModel: VideoViewModel {
    func getLive() async {
        await getVideo(url: hololiveLiveURL) { responseResult in
            self.videoList = responseResult
            self.videoList.sort(by: liveSortStrategy)
            self.videoList = self.videoList.filter {$0.isHololive}
        }
    }
}
