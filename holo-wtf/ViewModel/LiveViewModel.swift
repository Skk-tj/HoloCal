//
//  LiveViewModel.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-21.
//

import Foundation
import OSLog

@MainActor
class LiveViewModel: VideoListViewModel {
    func getLive() async {
        guard let apiURL = URL(string: "https://api.holotools.app/v1/live") else {
            logger.critical("Live API URL is not valid")
            self.dataStatus = .fail
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            
            let decoder = getDateParser()
            
            let liveResponseResult: LiveResponse = try decoder.decode(LiveResponse.self, from: data)
            
            self.videoList = liveResponseResult.live
            self.videoList.sort(by: {$0.liveSchedule ?? Date() > $1.liveSchedule ?? Date()})
            self.dataStatus = .success
        } catch {
            logger.error("Netword request/JSON serialization failed when trying to get live data from API. ")
            debugPrint(error)
            logger.error("Error is: \(error.localizedDescription)")
            self.dataStatus = .fail
            return
        }
    }
}
