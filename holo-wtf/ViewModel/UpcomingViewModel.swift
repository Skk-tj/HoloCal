//
//  NewUpcomingViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class UpcomingViewModel: VideoViewModel, VideoGettable {
    let videoUrl: String
    
    override init(for agency: AgencyEnum) {
        self.videoUrl = getUpcomingUrl(for: agency)
        super.init(for: agency)
    }
    
    @MainActor
    func getVideoForUI() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        
        await getVideo(url: String(format: videoUrl, upcomingLookAhead)) { responseResult in
            self.videoList = responseResult
            self.sortVideos()
            self.videoList = self.videoList.filter {
                $0.isAgency(agency: self.agency)
            }
        }
    }
}
