//
//  ConcertsViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

class ConcertsViewModel: ObservableObject {
    @Published var concertList: [LiveConcert]
    @Published var dataStatus: DataStatus
    
    init() {
        self.concertList = []
        self.dataStatus = .working
    }
    
    let logger = Logger()
    
    @MainActor
    func getConcertsForUI() async {
        self.dataStatus = .working
        
        do {
            self.concertList = try await getConcerts()
            self.dataStatus = .success
        } catch {
            self.dataStatus = .fail
        }
    }
    
    func getConcerts() async throws -> [LiveConcert] {
        guard let apiURL = URL(string: concertAPIURL) else {
            logger.critical("API URL is not valid")
            throw VideoFetchServiceError.apiUrlError
        }
        
        var request = URLRequest(url: apiURL)
        request.httpMethod = "GET"
        request.cachePolicy = .useProtocolCachePolicy
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw VideoFetchServiceError.network((response as? HTTPURLResponse)?.statusCode ?? 0)
            }
            
            let decoder = getLiveConcertJSONDecoder()
            
            let responseResult = try decoder.decode([LiveConcert].self, from: data)
            print(responseResult)
            
            return responseResult
        } catch {
            logger.error("Network request failed when trying to get live data from API. ")
            debugPrint(error)
            logger.error("Error is: \(error.localizedDescription)")
            
            throw VideoFetchServiceError.network(-1)
        }
    }
}
