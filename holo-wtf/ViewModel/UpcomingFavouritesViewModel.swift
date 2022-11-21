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
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        
        await getVideo(url: String(format: allUpcomingURL, upcomingLookAhead)) { responseResult in
            self.videoList = responseResult
            self.sortVideos(by: .timeAsc)
            self.videoList = self.videoList.filter {
                return $0.isHololive || $0.isNijisanji
            }
        }
    }
}
