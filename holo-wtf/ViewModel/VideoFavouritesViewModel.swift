//
//  VideoFavouritesViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class VideoFavoritesViewModel: VideoViewModel {
    let urls: [String]
    
    init(videoType: VideoType) {
        self.urls = AgencyEnum.allCases.map {
            switch videoType {
            case .live:
                return getLiveUrl(for: $0)
            case .upcoming:
                return getUpcomingUrl(for: $0)
            case .past:
                return getPastUrl(for: $0)
            }
        }
        
        super.init(for: .hololive, videoType: videoType)
        
        switch videoType {
        case .live:
            self.sortingStrategy = .timeDesc
        case .upcoming:
            self.sortingStrategy = .timeAsc
        case .past:
            self.sortingStrategy = .endedFirst
        }
    }
    
    @MainActor
    override func getVideoForUI() async {
        await getVideosForFavourites(urls: self.urls, groupName: "group.io.skk-tj.holo-wtf.ios") { responseResult in
            self.videoList = responseResult
            self.sortVideos()
            self.videoList = self.videoList.filter { $0.isSupportedAgency }
        }
    }
}
