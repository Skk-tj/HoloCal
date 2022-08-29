//
//  SongsViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-08-27.
//

import Foundation

enum SongDataStatus {
    case working
    case finished
}


@MainActor
class SongsViewModel: ObservableObject {
    let songsRaw: [SongInStream]
    
    @Published var songsProcessed: [SongInStream]
    @Published var songDataStatus: SongDataStatus
    
    init(songsRaw: [SongInStream]) {
        self.songsRaw = songsRaw
        self.songsProcessed = []
        self.songDataStatus = .working
    }
    
    func updateAllSongsWithMusicKit() async {
        await withTaskGroup(of: SongInStream.self) { group in
            for song in self.songsRaw {
                group.addTask {
                    return await song.updateSongWithMusicKit()
                }
            }
            
            self.songsProcessed.reserveCapacity(self.songsRaw.count)
            
            for await song in group {
                songsProcessed.append(song)
            }
        }
        
        self.songDataStatus = .finished
        self.songsProcessed.sort(by: {
            $0.start < $1.start
        })
    }
}
