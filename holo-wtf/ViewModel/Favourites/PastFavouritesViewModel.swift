//
//  PastFavouritesViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class PastFavoritesViewModel: VideoViewModel {
    var urls: [String] = AgencyEnum.allCases.map { getPastUrl(for: $0) }
    
    init() {
        super.init(for: .hololive, videoType: .past)
        self.sortingStrategy = .endedFirst
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
