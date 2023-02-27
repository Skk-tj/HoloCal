//
//  AccessoryRectangularWidgetView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryRectangularWidgetView: View {
    @Environment(\.widgetRenderingMode) var renderingMode
    let video: LiveVideo
    let videoType: VideoType
    
    var body: some View {
        VStack(alignment: .leading) {
            switch renderingMode {
            case .accented:
                switch videoType {
                case .live:
                    Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                        .font(.headline)
                        .widgetAccentable()
                case .upcoming:
                    Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                        .font(.headline)
                        .widgetAccentable()
                case .past:
                    Label("PAST_WIDGET_TITLE_NON_BOLD", systemImage: "clock.arrow.circlepath")
                        .font(.headline)
                        .widgetAccentable()
                }
            default:
                switch videoType {
                case .live:
                    Label("LIVE_WIDGET_TITLE_NON_BOLD", systemImage: "person.wave.2.fill")
                        .font(.headline)
                case .upcoming:
                    Label("UPCOMING_WIDGET_TITLE_NON_BOLD", systemImage: "clock")
                        .font(.headline)
                case .past:
                    Label("PAST_WIDGET_TITLE_NON_BOLD", systemImage: "clock.arrow.circlepath")
                        .font(.headline)
                }
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
