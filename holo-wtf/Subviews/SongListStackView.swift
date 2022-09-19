//
//  SongListStackView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-18.
//

import SwiftUI

@available(iOS 16.0, *)
struct SongListStackView: View {
    @Environment(\.dismiss) var dismiss
    
    let videoURL: URL
    
    @EnvironmentObject var songsViewModel: SongsViewModel
    
    var body: some View {
        NavigationStack {
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

@available(iOS 16.0, *)
struct SongListStackView_Previews: PreviewProvider {
    static var previews: some View {
        SongListStackView(videoURL: URL(string: "https://www.youtube.com/watch?v=0ntqQpqO0J4")!)
            .environmentObject(SongsViewModel(songsRaw: SongInStream.exampleSongs))
    }
}