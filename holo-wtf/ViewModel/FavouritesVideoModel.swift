//
//  FavouritesVideoModel.swift
//  holo-wtf
//
//
//

import Foundation

class FavouritesViewModel: VideoViewModel, VideoGettable {
    let groupName: String?
    var urls: [String] = [hololiveLiveURL, nijisanjiLiveURL, reactLiveURL]
    
    init(groupName: String? = nil) {
        self.groupName = groupName
        super.init(for: .hololive)
        self.sortingStrategy = .timeDesc
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
