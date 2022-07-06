//
//  File.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-06-17.
//

import Foundation
import MusicKit

enum SongRequestError: Error {
    case notFound
    case notAuthorized
}

struct MySingleSongReponse: Decodable {
    let data: [Song]?
}

struct SongInStream: Codable, Identifiable, Hashable {
    let id: UUID
    let start: Int
    let end: Int
    let name: String
    let originalArtist: String
    let itunesid: Int
    
    var MKsong: Song?
    
    static let exampleSong = SongInStream(id: UUID(uuidString: "159d5e0d-6b74-4b3f-869a-d47ac0aa6e01")!, start: 3220, end: 223, name: "My only gradation", originalArtist: "fuji aoi", itunesid: 1585332602)
    
    static let exampleSongs: [SongInStream] = [
        SongInStream(id: UUID(uuidString: "159d5e0d-6b74-4b3f-869a-d47ac0aa6e01")!, start: 3220, end: 223, name: "My only gradation", originalArtist: "fuji aoi", itunesid: 1585332602),
        SongInStream(id: UUID(uuidString: "3c812748-3595-4b82-8310-0e397e8cb517")!, start: 823, end: 223, name: "king", originalArtist: "kanaria", itunesid: 1580886351)
    ]
    
    func getSongInfo() async throws -> Song {
        let authorizationStatus = await MusicAuthorization.request()
        
        if authorizationStatus == .authorized {
            let countryCode = try await MusicDataRequest.currentCountryCode
            let url = URL(string: "https://api.music.apple.com/v1/catalog/\(countryCode)/songs/\(self.itunesid)")!
            
            let dataRequest = MusicDataRequest(urlRequest: URLRequest(url: url))
            let dataResponse = try await dataRequest.response()
            
            let decoder = JSONDecoder()
            
            do {
                let songResponse = try decoder.decode(MySingleSongReponse.self, from: dataResponse.data)
                
                if let song: [Song] = songResponse.data {
                    guard let firstSong = song.first else {
                        throw SongRequestError.notFound
                    }
                    return firstSong
                } else {
                    throw SongRequestError.notFound
                }
            } catch {
                throw SongRequestError.notFound
            }
        } else {
            throw SongRequestError.notAuthorized
        }
    }
}
