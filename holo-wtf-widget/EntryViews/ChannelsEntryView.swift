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

struct LiveChannelsEntryView: View {
    var entry: ChannelsLiveWidgetProvider.Entry
    
    var body: some View {
        BaseChannelsEntryView(entry: entry, channelsView: {
            LiveChannelsView(channels: entry.channels, thumbnails: entry.thumbnails)
        }, titleView: {
            LiveTitleView()
        })
    }
}

struct UpcomingChannelsEntryView: View {
    var entry: ChannelsUpcomingWidgetProvider.Entry
    
    var body: some View {
        BaseChannelsEntryView(entry: entry, channelsView: {
            LiveChannelsView(channels: entry.channels, thumbnails: entry.thumbnails)
        }, titleView: {
            UpcomingTitleView()
        })
    }
}
