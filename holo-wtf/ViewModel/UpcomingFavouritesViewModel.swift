//
//  UpcomingFavouritesViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class UpcomingFavoritesViewModel: FavouritesViewModel {
    override init(groupName: String? = nil) {
        super.init(groupName: groupName)
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        let urls = [hololiveUpcomingURL, nijisanjiUpcomingURL, reactUpcomingURL]
        self.urls = urls.map({ url in String(format: url, upcomingLookAhead) })
        self.sortingStrategy = .timeAsc
    }
    
    @MainActor
    override func getVideoForUI() async {
        await getVideosForFavourites(urls: self.urls, groupName: self.groupName) { responseResult in
            self.videoList = responseResult
            
            self.sortVideos()
            self.videoList = self.videoList.filter { ($0.isHololive || $0.isNijisanji || $0.isReact) }
        }
    }
}
