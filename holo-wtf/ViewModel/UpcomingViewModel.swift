//
//  NewUpcomingViewModel.swift
//  holo-wtf
//
//
//

import Foundation

@MainActor
class UpcomingViewModel: VideoViewModel {
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
    
    func getUpcoming() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        
        await getVideo(url: String(format: videoUrl, upcomingLookAhead)) { responseResult in
            self.videoList = responseResult
            self.videoList.sort(by: upcomingSortStrategy)
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
