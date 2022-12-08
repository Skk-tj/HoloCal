//
//  NewLiveViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class LiveViewModel: VideoViewModel, VideoGettable {
    let videoUrl: String
    
    override init(for agency: AgencyEnum) {
        switch agency {
        case .hololive:
            self.videoUrl = hololiveLiveURL
        case .nijisanji:
            self.videoUrl = nijisanjiLiveURL
        case .react:
            self.videoUrl = reactLiveURL
        }
        
        super.init(for: agency)
    }
    
    @MainActor
    func getVideoForUI() async {
        await getVideo(url: videoUrl) { responseResult in
            self.videoList = responseResult
            self.sortVideos(by: .timeDesc)
            self.videoList = self.videoList.filter {
                $0.isAgency(agency: self.agency)
            }
        }
    }
}
