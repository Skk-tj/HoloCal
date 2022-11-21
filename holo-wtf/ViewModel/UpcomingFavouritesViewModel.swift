//
//  UpcomingFavouritesViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-20.
//

import Foundation

class UpcomingFavoritesViewModel: VideoViewModel {
    @MainActor
    func getUpcoming() async {
        await getVideo(url: allUpcomingURL) { responseResult in
            self.videoList = responseResult
            self.videoList.sort(by: upcomingSortStrategy)
            self.videoList = self.videoList.filter {
                return $0.isHololive || $0.isNijisanji
            }
        }
    }
}
