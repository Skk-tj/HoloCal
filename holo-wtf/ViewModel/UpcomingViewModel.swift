//
//  NewUpcomingViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
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
        }
        
        super.init(for: agency)
    }
    
    @MainActor
    func getVideoForUI() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        
        await getVideo(url: String(format: videoUrl, upcomingLookAhead)) { responseResult in
            self.videoList = responseResult
            self.sortVideos(by: .timeAsc)
            self.videoList = self.videoList.filter {
                switch self.agency {
                case .hololive:
                    return $0.isHololive
                case .nijisanji:
                    return $0.isNijisanji
                }
            }
        }
    }
}
