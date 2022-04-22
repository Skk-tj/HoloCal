//
//  NewUpcomingViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

@MainActor
class UpcomingViewModel: VideoViewModel {
    func getUpcoming() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        
        await getVideo(url: "https://holodex.net/api/v2/live?status=upcoming&type=stream&org=Hololive&max_upcoming_hours=\(upcomingLookAhead)") { responseResult in
            self.videoList = responseResult
            self.videoList.sort(by: {$0.startActual ?? Date() > $1.startActual ?? Date()})
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
