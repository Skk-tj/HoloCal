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
                .alignmentGuide(.leading) { d in d[.trailing]}
            
            VStack(alignment: .leading) {
                Text("\(song.MKsong?.title ?? song.name)")
                Text("\(song.MKsong?.artistName ?? song.originalArtist)")
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
            if let itunesURL = song.MKsong?.url {
                Link(destination: itunesURL) {
                    Label("SINGLE_SONG_VIEW_CONTECT_MENU_OPEN_IN_APPLE_MUSIC", systemImage: "music.note")
                }
            }
            
            Link(destination: songStartURL.url!) {
                Label("SINGLE_SONG_VIEW_CONTECT_MENU_JUMP_TO_SONG_IN_VIDEO", systemImage: "play.rectangle")
            }
        }
    }
}

struct SingleSongView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSongView(count: 1, videoURL: URL(string: "https://youtu.be/b1ChFwNTvMo")!, song: SongInStream.exampleSong)
    }
}
