//
//  ChannelsEntryView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct BaseChannelsEntryView<MainContent: View, TitleContent: View>: View {
    var entry: ChannelsEntry
    
    @ViewBuilder let channelsView: () -> MainContent
    @ViewBuilder let titleView: () -> TitleContent
    
    @ViewBuilder
    var body: some View {
        VStack {
            titleView()
            
            switch entry.status {
            case .ok:
                if !entry.channels.isEmpty {
                    Spacer()
                    channelsView()
                    Spacer()
                } else {
                    NoStreamView()
                }
            case .noVideo:
                NoStreamView()
            case .network:
                NetworkErrorView()
            }
        }
        .padding()
    }
}

struct ChannelsEntryView: View {
    var entry: ChannelsEntry
    let videoType: VideoType
    
    var body: some View {
        BaseChannelsEntryView(entry: entry, channelsView: {
            ChannelsView(channels: entry.channels, thumbnails: entry.thumbnails)
        }, titleView: {
            switch videoType {
            case .live:
                LiveTitleView()
            case .upcoming:
                UpcomingTitleView()
            case .past:
                PastTitleView()
            }
        })
    }
}