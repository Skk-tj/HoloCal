//
//  SingleSongView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SingleSongView: View {
    let count: Int
    let videoURL: URL
    let song: SongInStream
    
    var body: some View {
        var songStartURL = URLComponents(url: videoURL, resolvingAgainstBaseURL: true)!
        
        let queryItem = URLQueryItem(name: "t", value: "\(song.start)")
        songStartURL.queryItems?.append(queryItem)
        
        return HStack {
            Text("\(count)")
                .foregroundColor(.secondary)
                .alignmentGuide(.leading) { dimension in dimension[.trailing]}
            
            VStack(alignment: .leading) {
                Text("\(song.mkSong?.title ?? song.name)")
                Text("\(song.mkSong?.artistName ?? song.originalArtist)")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            
            Spacer()
            
            Link(destination: songStartURL.url!) {
                Label("YouTube", systemImage: "play.rectangle")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.plain)
        }
        .contextMenu {
            if let iTunesURL = song.mkSong?.url {
                Link(destination: iTunesURL) {
                    Label("SINGLE_SONG_VIEW_CONTEXT_MENU_OPEN_IN_APPLE_MUSIC", systemImage: "music.note")
                }
            }
            
            Link(destination: songStartURL.url!) {
                Label("SINGLE_SONG_VIEW_CONTEXT_MENU_JUMP_TO_SONG_IN_VIDEO", systemImage: "play.rectangle")
            }
        }
    }
}

struct SingleSongView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSongView(count: 1, videoURL: URL(string: "https://youtu.be/b1ChFwNTvMo")!, song: SongInStream.exampleSong)
    }
}
