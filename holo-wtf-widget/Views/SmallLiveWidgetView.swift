//
//  SmallLiveWidgetView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct SmallLiveWidgetView: View {
    let live: LiveVideo
    let avatarData: Data
    
    var body: some View {
        let lang: NameLanguage = Locale.current.languageCode == "ja" ? .ja : .en
        
        VStack(alignment: .leading) {
            HStack {
                Text("LIVE_WIDGET_TITLE")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
            if let avatarImage = UIImage(data: avatarData) {
                Image(uiImage: avatarImage)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 1)
                    }
                    .shadow(radius: 3)
            }
            
            Spacer()
            
            Text(live.channel.talent.names[lang]!)
                .lineLimit(1)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(live.escapedTitle)
                .lineLimit(3)
                .font(.caption)
        }
        .padding()
    }
}

struct SmallLiveWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallLiveWidgetView(live: LiveVideo.previewLive, avatarData: Data())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
