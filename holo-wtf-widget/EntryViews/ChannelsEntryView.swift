//
//  ChannelsEntryView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct BaseChannelsEntryView<MainContent: View, TitleContent: View>: View {
    let entry: ChannelsEntry
    
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

struct AppIntentBaseChannelsEntryView<MainContent: View, TitleContent: View>: View {
    let entry: AppIntentChannelsEntry
    
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
    }
}

struct ChannelsEntryView: View {
    let entry: ChannelsEntry
    let videoType: VideoType
    
    var body: some View {
        BaseChannelsEntryView(entry: entry, channelsView: {
            ChannelsView(channels: Array(entry.channels), thumbnails: entry.thumbnails)
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
        .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency.rawValue)))
    }
}

struct AppIntentChannelsEntryView: View {
    let entry: AppIntentChannelsEntry
    let videoType: VideoType
    
    var body: some View {
        AppIntentBaseChannelsEntryView(entry: entry, channelsView: {
            ChannelsView(channels: Array(entry.channels), thumbnails: entry.thumbnails)
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
        .widgetURL(URL(string: String(format: widgetDeepLink, videoTypeToWidgetDeepLink[videoType]!.rawValue, entry.agency?.rawValue ?? "")))
    }
}
