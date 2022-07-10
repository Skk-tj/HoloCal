//
//  LiveWidgetMediumView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-07-10.
//

import SwiftUI
import WidgetKit

struct LiveWidgetMediumView: View {
    let video: LiveVideo
    let videoThumbnail: Data
    
    var body: some View {
        let lang: NameLanguage = Locale.current.languageCode == "ja" ? .ja : .en
        
        HStack {
            Image(systemName: "person.wave.2.fill")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Text("LIVE_WIDGET_TITLE")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        
        Spacer()
        
        HStack {
            if let image = UIImage(data: videoThumbnail) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(video.escapedTitle)
                    .lineLimit(3)
                    .font(.footnote)
                
                Text(video.channel.talent.names[lang]!)
                    .foregroundColor(.secondary)
                    .font(.caption2)
                
                Text("\(Image(systemName: "eye")) \(video.liveViewers)")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                
            }
        }
    }
}

struct LiveWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        LiveWidgetMediumView(video: LiveVideo.previewLive, videoThumbnail: Data())
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
