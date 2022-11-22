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
            let favourites = getFavouritesFromUserDefaults()
            
            self.videoList = responseResult
            self.sortVideos(by: .timeDesc)
            self.videoList = self.videoList.filter {
                return ($0.isHololive || $0.isNijisanji) && favourites.contains($0.channel.id)
            }
        }
    }
}
