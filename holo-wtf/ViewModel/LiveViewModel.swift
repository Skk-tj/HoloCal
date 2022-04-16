//
//  NewLiveViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

@MainActor
class LiveViewModel: VideoViewModel {
    func getLive() async {
        await getVideo(url: "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream") { responseResult in
            self.videoList = responseResult
            self.videoList.sort(by: {$0.startActual ?? Date() > $1.startActual ?? Date()})
            self.videoList = self.videoList.filter { video in
                video.channel.org == "Hololive"
            }
        }
    }
}
