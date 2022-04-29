//
//  NewLiveViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import Foundation
import OSLog

@MainActor
class LiveViewModel: VideoViewModel {
    func getLive() async {
        await getVideo(url: "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream") { responseResult in
            self.videoList = responseResult
            self.videoList.sort(by: {$0.startActual ?? Date.distantFuture > $1.startActual ?? Date.distantFuture})
            self.videoList = self.videoList.filter { video in
                video.channel.org == "Hololive"
            }
        }
        
        do {
            self.twitterList = try await getTwitter()
        } catch {
            logger.error("Error in getting twitter list")
            debugPrint(error)
        }
    }
}
