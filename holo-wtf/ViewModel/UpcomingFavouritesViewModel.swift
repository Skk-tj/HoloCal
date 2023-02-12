//
//  UpcomingFavouritesViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class UpcomingFavoritesViewModel: VideoViewModel, VideoGettable {
    let groupName: String?
    var urls: [String] = [hololiveUpcomingURL, nijisanjiUpcomingURL, reactUpcomingURL]
    
    init(groupName: String? = nil) {
        self.groupName = groupName
        super.init(for: .hololive)
        self.sortingStrategy = .timeDesc
        
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        self.urls = urls.map({ url in String(format: url, upcomingLookAhead) })
        self.sortingStrategy = .timeAsc
    }
    
    @MainActor
    func getVideoForUI() async {
        await getVideosForFavourites(urls: self.urls, groupName: self.groupName) { responseResult in
            self.videoList = responseResult
            
            self.sortVideos()
            self.videoList = self.videoList.filter { ($0.isHololive || $0.isNijisanji || $0.isReact) }
        }
    }
}
