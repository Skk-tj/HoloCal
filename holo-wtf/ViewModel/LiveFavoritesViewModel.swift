//
//  LiveFavoriteViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-20.
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
