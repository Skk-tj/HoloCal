//
//  UpcomingFavouritesViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class UpcomingFavoritesViewModel: VideoViewModel, VideoGettable {
    @MainActor
    func getVideoForUI() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        let favourites = getFavouritesFromUserDefaults(groupName: "group.io.skk-tj.holo-wtf.ios")
        self.dataStatus = .working
        
        do {
            var getResult: [LiveVideo] = []
            
            async let hololiveUpcoming = getVideos(from: String(format: hololiveUpcomingURL, upcomingLookAhead))
            async let nijisanjiUpcoming = getVideos(from: String(format: nijisanjiUpcomingURL, upcomingLookAhead))
            
            getResult.append(contentsOf: (try? await hololiveUpcoming) ?? [])
            getResult.append(contentsOf: (try? await nijisanjiUpcoming) ?? [])
            
            getResult = getResult.filter {
                favourites.contains($0.channel.id)
            }
            
            let getResultWithTwitter: [LiveVideo] = try await getTwitterForAll(videoList: getResult)
            
            self.videoList = getResultWithTwitter
            
            self.sortVideos(by: .timeAsc)
            self.videoList = self.videoList.filter {
                return ($0.isHololive || $0.isNijisanji) && favourites.contains($0.channel.id)
            }
            
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
}
