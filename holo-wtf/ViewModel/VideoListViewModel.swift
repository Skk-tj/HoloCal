//
//  VideoListViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

@MainActor
class VideoListViewModel: ObservableObject {
    @Published var videoList: [LiveVideo]
    @Published var dataStatus: DataStatus
    
    init() {
        self.videoList = []
        self.dataStatus = .working
    }
    
    let logger = Logger()
    
    func getVideos(url: String, completion: @escaping (LiveResponse) -> Void) async {
        self.dataStatus = .working
        
        guard let apiURL = URL(string: url) else {
            logger.critical("API URL is not valid")
            self.dataStatus = .fail
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            
            let decoder = getDateParser()
            
            let liveResponseResult: LiveResponse = try decoder.decode(LiveResponse.self, from: data)
            
            completion(liveResponseResult)
            
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
