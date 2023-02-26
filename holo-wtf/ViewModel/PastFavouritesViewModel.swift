//
//  PastFavouritesViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class PastFavoritesViewModel: VideoViewModel, VideoGettable {
    let groupName: String?
    var urls: [String] = AgencyEnum.allCases.map { getPastUrl(for: $0) }
    
    init(groupName: String? = nil) {
        self.groupName = groupName
        super.init(for: .hololive)
        self.sortingStrategy = .endedFirst
    }
    
    @MainActor
    func getVideoForUI() async {
        await getVideosForFavourites(urls: self.urls, groupName: self.groupName) { responseResult in
            self.videoList = responseResult
            self.sortVideos()
            self.videoList = self.videoList.filter { $0.isSupportedAgency }
        }
    }
}
