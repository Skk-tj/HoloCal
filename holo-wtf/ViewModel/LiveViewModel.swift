//
//  NewLiveViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

@MainActor
class LiveViewModel: ObservableObject {
    @Published var videoList: [LiveVideo]
    @Published var dataStatus: DataStatus
    
    init() {
        self.videoList = []
        self.dataStatus = .working
    }
    
    let logger = Logger()
    
    func getVideo() async {
        self.dataStatus = .working
        
        guard let apiURL = URL(string: "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream") else {
            logger.critical("API URL is not valid")
            self.dataStatus = .fail
            return
        }
        
        let headers = ["Content-Type": "application/json", "X-APIKEY": Bundle.main.object(forInfoDictionaryKey: "HOLODEX_API_KEY") as! String]
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.cachePolicy = .useProtocolCachePolicy
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = getDateParser()
            
            let responseResult: [LiveVideo] = try decoder.decode([LiveVideo].self, from: data)
            
            self.videoList = responseResult
            self.videoList.sort(by: {$0.startActual ?? Date() > $1.startActual ?? Date()})
            self.videoList = self.videoList.filter { video in
                video.channel.org == "Hololive"
            }
            
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
