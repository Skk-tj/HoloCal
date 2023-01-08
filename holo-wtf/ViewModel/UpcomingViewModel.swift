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
        switch agency {
        case .hololive:
            self.videoUrl = hololiveUpcomingURL
        case .nijisanji:
            self.videoUrl = nijisanjiUpcomingURL
        case .react:
            self.videoUrl = reactUpcomingURL
        }
        
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
