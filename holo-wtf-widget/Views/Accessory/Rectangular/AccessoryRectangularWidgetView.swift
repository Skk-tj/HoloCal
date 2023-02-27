//
//  AccessoryRectangularWidgetView.swift
//  holo-wtf
//
// 
//

import SwiftUI

struct AccessoryRectangularWidgetView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    let titleView: () -> TitleContent
    let video: LiveVideo
    
    var body: some View {
        VStack(alignment: .leading) {
            switch renderingMode {
            case .accented:
                titleView()
                    .font(.headline)
                    .widgetAccentable()
            default:
                titleView()
                    .font(.headline)
            }
            
            Text(video.title)
                .lineLimit(1)
            
            Text(video.channel.getTalentName())
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
