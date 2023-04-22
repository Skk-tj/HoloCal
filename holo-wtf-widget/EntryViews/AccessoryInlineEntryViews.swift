//
//  AccessoryInlineEntryView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryInlineEntryView: View {
    let entry: SingleVideoWidgetEntry
    let videoType: VideoType
    
    var body: some View {
        if let video = entry.video {
            AccessoryInlineWidgetView(video: video, videoType: videoType)
                .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
        } else {
            switch videoType {
            case .live:
                Text("\(Image(systemName: "person.wave.2.fill")) \(NSLocalizedString("NO_ONE_IS_STREAMING", comment: ""))")
            case .upcoming:
                Text("\(Image(systemName: "clock")) \(NSLocalizedString("NO_ONE_IS_STREAMING", comment: ""))")
            case .past:
                Text("\(Image(systemName: "clock.arrow.circlepath")) \(NSLocalizedString("NO_ONE_IS_STREAMING", comment: ""))")
            }
        }
    }
}

struct AccessoryInlineEntryView_Preview: PreviewProvider {
    static var previews: some View {
        AccessoryInlineEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: LiveVideo.previewLive, avatarData: Data(), thumbnailData: Data(), agency: .hololive), videoType: .live)
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
        
        AccessoryInlineEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: nil, avatarData: Data(), thumbnailData: Data(), agency: .hololive), videoType: .live)
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
        
        AccessoryInlineEntryView(entry: SingleVideoWidgetEntry(date: Date(), status: .ok, video: nil, avatarData: Data(), thumbnailData: Data(), agency: .hololive), videoType: .live)
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
            .environment(\.locale, .init(identifier: "ja"))
    }
}
