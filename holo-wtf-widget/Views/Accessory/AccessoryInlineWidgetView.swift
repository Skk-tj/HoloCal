//
//  AccessoryInlineWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryInlineWidgetView: View {
    let video: LiveVideo
    let videoType: VideoType
    
    var body: some View {
        switch videoType {
        case .live:
            Text("\(Image(systemName: "person.wave.2.fill")) \(video.channel.getTalentName())")
        case .upcoming:
            Text("\(Image(systemName: "clock")) \(video.channel.getTalentName())")
        case .past:
            Text("\(Image(systemName: "clock.arrow.circlepath")) \(video.channel.getTalentName())")
        }
    }
}

struct AccessoryInlineWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryInlineWidgetView(video: LiveVideo.previewLive, videoType: .live)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
        
        AccessoryInlineWidgetView(video: LiveVideo.previewLive, videoType: .live)
            .previewDevice(PreviewDevice(rawValue: "Apple Watch Ultra (49mm)"))
            .previewContext(WidgetPreviewContext(family: .accessoryInline))
    }
}
