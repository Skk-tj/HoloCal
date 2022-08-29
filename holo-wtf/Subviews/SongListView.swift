//
//  SongListView.swift
//  holo-wtf
//
//
//

import SwiftUI
import MusicKit

struct SongListView: View {
    let videoURL: URL
    
    @EnvironmentObject var songsViewModel: SongsViewModel
    
    var body: some View {
        switch songsViewModel.songDataStatus {
        case .working:
            ProgressView()
                .navigationTitle("SONG_LIST_VIEW_NAVIGATION_TITLE")
                .task {
                    await songsViewModel.updateAllSongsWithMusicKit()
                }
        case .finished:
            List(songsViewModel.songsProcessed.indexed(), id: \.element) { i, song in
                SingleSongView(count: i + 1, videoURL: videoURL, song: song)
            }
            .navigationTitle("SONG_LIST_VIEW_NAVIGATION_TITLE")
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(videoURL: URL(string: "https://www.youtube.com/watch?v=0ntqQpqO0J4")!)
            .environmentObject(SongsViewModel(songsRaw: SongInStream.exampleSongs))
    }
}
