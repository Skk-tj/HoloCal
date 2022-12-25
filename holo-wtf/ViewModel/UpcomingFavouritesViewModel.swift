//
//  UpcomingFavouritesViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class UpcomingFavoritesViewModel: VideoViewModel, VideoGettable {
    let groupName: String?
    
    init(groupName: String? = nil) {
        self.groupName = groupName
        super.init(for: .hololive)
    }
    
    @MainActor
    func getVideoForUI() async {
        let upcomingLookAhead = getUpcomingStreamLookAheadHoursFromUserDefaults()
        let favourites = getFavouritesFromUserDefaults(groupName: groupName)
        self.dataStatus = .working
        
        do {
            var getResult: [LiveVideo] = []
            
            async let hololiveUpcoming = getVideos(from: String(format: hololiveUpcomingURL, upcomingLookAhead))
            async let nijisanjiUpcoming = getVideos(from: String(format: nijisanjiUpcomingURL, upcomingLookAhead))
            async let reactUpcoming = getVideos(from: String(format: reactUpcomingURL, upcomingLookAhead))
            
            getResult.append(contentsOf: (try? await hololiveUpcoming) ?? [])
            getResult.append(contentsOf: (try? await nijisanjiUpcoming) ?? [])
            getResult.append(contentsOf: (try? await reactUpcoming) ?? [])
            
            getResult = getResult.filter {
                favourites.contains($0.channel.id)
            }
            
            let getResultWithTwitter: [LiveVideo] = try await getTwitterForAll(videoList: getResult)
            
            self.videoList = getResultWithTwitter
            
            self.sortVideos(by: .timeAsc)
            self.videoList = self.videoList.filter {
                return ($0.isHololive || $0.isNijisanji || $0.isReact) && favourites.contains($0.channel.id)
            }
            
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
}
