//
//  SongListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-06-17.
//

import SwiftUI

struct SongListView: View {
    let videoURL: URL
    let songs: [SongInStream]
    
    var body: some View {
        List(songs.indexed(), id: \.element) { i, song in
            SingleSongView(count: i + 1, videoURL: videoURL, song: song)
        }
        .navigationTitle("SONG_LIST_VIEW_NAVIGATION_TITLE")
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(videoURL: URL(string: "https://youtu.be/b1ChFwNTvMo")!, songs: SongInStream.exampleSongs)
    }
}
