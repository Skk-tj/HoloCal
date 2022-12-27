//
//  LiveFavoriteViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class LiveFavoritesViewModel: VideoViewModel, VideoGettable {
    let groupName: String?
    
    init(groupName: String? = nil) {
        self.groupName = groupName
        super.init(for: .hololive)
    }
    
    @MainActor
    func getVideoForUI() async {
        let favourites = getFavouritesFromUserDefaults(groupName: self.groupName)
        self.dataStatus = .working
        
        do {
            var getResult: [LiveVideo] = []
            
            async let hololiveLive = getVideos(from: hololiveLiveURL)
            async let nijisanjiLive = getVideos(from: nijisanjiLiveURL)
            async let reactLive = getVideos(from: reactLiveURL)
            
            getResult.append(contentsOf: (try? await hololiveLive) ?? [])
            getResult.append(contentsOf: (try? await nijisanjiLive) ?? [])
            getResult.append(contentsOf: (try? await reactLive) ?? [])
            
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
