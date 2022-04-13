//
//  UpcomingViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

@MainActor
class UpcomingViewModel: VideoListViewModel {
    func getUpcoming() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        
        await getVideos(url: "https://api.holotools.app/v1/live?max_upcoming_hours=\(upcomingLookAhead)&lookback_hours=0&hide_channel_desc=1") { liveResponse in
            self.videoList = liveResponse.upcoming
            self.videoList.sort(by: {$0.liveSchedule ?? Date() < $1.liveSchedule ?? Date()})
        }
    }
}
