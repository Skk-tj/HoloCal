//
//  SongListView.swift
//  holo-wtf
//
//
//

import SwiftUI
import MusicKit

enum SongDataStatus {
    case working
    case done
}

struct SongListView: View {
    let videoURL: URL
    
    @State var songs: [SongInStream]
    
    @State var songDataStatus: SongDataStatus = .working
    
    var body: some View {
        switch songDataStatus {
        case .working:
            ProgressView()
                .navigationTitle("SONG_LIST_VIEW_NAVIGATION_TITLE")
                .task {
                    await withThrowingTaskGroup(of: Void.self) { group in
                        for i in songs.indices {
                            group.addTask {
                                try await songs[i].writeMKSongInfo()
                            }
                        }
                    }
                    
                    songDataStatus = .done
                }
        case .done:
            List(songs.indexed(), id: \.element) { i, song in
                SingleSongView(count: i + 1, videoURL: videoURL, song: song)
            }
            .navigationTitle("SONG_LIST_VIEW_NAVIGATION_TITLE")
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(videoURL: URL(string: "https://youtu.be/b1ChFwNTvMo")!, songs: SongInStream.exampleSongs)
    }
}
