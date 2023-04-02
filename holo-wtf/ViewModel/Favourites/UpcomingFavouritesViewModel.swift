//
//  UpcomingFavouritesViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class UpcomingFavoritesViewModel: VideoViewModel {
    var urls: [String] = AgencyEnum.allCases.map { getUpcomingUrl(for: $0) }
    
    init() {
        super.init(for: .hololive, videoType: .upcoming)
        
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        self.urls = urls.map({ url in String(format: url, upcomingLookAhead) })
        self.sortingStrategy = .timeAsc
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
