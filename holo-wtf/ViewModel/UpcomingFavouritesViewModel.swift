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
    
    @MainActor
    func getUpcomingForFavourites() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        self.dataStatus = .working
        
        do {
            var getResult: [LiveVideo] = []
            
            try await withThrowingTaskGroup(of: [LiveVideo].self) { group in
                group.addTask {
                    return try await getVideos(from: String(format: hololiveUpcomingURL, upcomingLookAhead))
                }
                group.addTask {
                    return try await getVideos(from: String(format: nijisanjiUpcomingURL, upcomingLookAhead))
                }
                
                for try await videos in group {
                    getResult.append(contentsOf: videos)
                }
            }
            
            let getResultWithTwitter: [LiveVideo] = try await getTwitterForAll(videoList: getResult)
            
            self.videoList = getResultWithTwitter
            
            self.sortVideos(by: .timeAsc)
            self.videoList = self.videoList.filter {
                return $0.isHololive || $0.isNijisanji
            }
            
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
}
