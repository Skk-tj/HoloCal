//
//  LiveFavoriteViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class LiveFavoritesViewModel: VideoViewModel {
    @MainActor
    func getLive() async {
        await getVideo(url: allLiveURL) { responseResult in
            self.videoList = responseResult
            self.sortVideos(by: .timeDesc)
            self.videoList = self.videoList.filter {
                return $0.isHololive || $0.isNijisanji
            }
        }
    }
}
