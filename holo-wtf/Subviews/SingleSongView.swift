//
//  SingleSongView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-06-17.
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
                Text("\(song.name)")
                Text("\(song.originalArtist)")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            
            Spacer()
            
            Link(destination: songStartURL.url!) {
                Label("YouTube", systemImage: "play.rectangle")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct SingleSongView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSongView(count: 1, videoURL: URL(string: "https://youtu.be/b1ChFwNTvMo")!, song: SongInStream.exampleSong)
    }
}
