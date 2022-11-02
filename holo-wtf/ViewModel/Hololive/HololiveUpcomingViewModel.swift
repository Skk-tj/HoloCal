//
//  NewUpcomingViewModel.swift
//  holo-wtf
//
//
//

import Foundation

@MainActor
class HololiveUpcomingViewModel: HololiveVideoViewModel {
    func getUpcoming() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        
        await getVideo(url: "https://holodex.net/api/v2/live?status=upcoming&type=stream&org=Hololive&include=songs,mentions&max_upcoming_hours=\(upcomingLookAhead)") { responseResult in
            self.videoList = responseResult
            self.videoList.sort(by: upcomingSortStrategy)
            self.videoList = self.videoList.filter {$0.isHololive}
        }
    }
}
