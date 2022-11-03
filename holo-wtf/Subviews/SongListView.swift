//
//  SongListView.swift
//  holo-wtf
//
//
//

import SwiftUI
import MusicKit

struct SongListView: View {
    @Environment(\.dismiss) var dismiss
    
    let videoURL: URL
    
    @StateObject var songsViewModel: SongsViewModel
    
    init(videoURL: URL, songsRaw: [SongInStream]) {
        self.videoURL = videoURL
        self._songsViewModel = StateObject(wrappedValue: SongsViewModel(songsRaw: songsRaw))
    }
    
    var body: some View {
        NavigationView {
            switch songsViewModel.songDataStatus {
            case .working:
                ProgressView()
                    .navigationTitle("SONG_LIST_VIEW_NAVIGATION_TITLE")
                    .task {
                        await songsViewModel.updateAllSongsWithMusicKit()
                    }
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("COLLAB_SHEET_DISMISS_BUTTON", role: .cancel) {
                                dismiss()
                            }
                        }
                    }
            case .finished:
                List(songsViewModel.songsProcessed.indexed(), id: \.element) { i, song in
                    SingleSongView(count: i + 1, videoURL: videoURL, song: song)
                }
                .navigationTitle("SONG_LIST_VIEW_NAVIGATION_TITLE")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("COLLAB_SHEET_DISMISS_BUTTON", role: .cancel) {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(videoURL: URL(string: "https://www.youtube.com/watch?v=0ntqQpqO0J4")!, songsRaw: SongInStream.exampleSongs)
    }
}
