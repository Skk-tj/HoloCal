//
//  NewLiveViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
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
        }
        
        super.init(for: agency)
    }
    
    @MainActor
    func getVideoForUI() async {
        await getVideo(url: videoUrl) { responseResult in
            self.videoList = responseResult
            self.sortVideos(by: .timeDesc)
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
