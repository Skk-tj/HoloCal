//
//  LiveFavoriteViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class LiveFavoritesViewModel: VideoViewModel {
    var urls: [String] = AgencyEnum.allCases.map { getLiveUrl(for: $0) }
    
    init() {
        super.init(for: .hololive, videoType: .live)
        self.sortingStrategy = .timeDesc
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
