//
//  BaseVideoEntryView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct BaseVideoEntryView<MainContent: View, TitleContent: View>: View {
    let entry: SingleVideoWidgetEntry
    
    @ViewBuilder let mainView: (_ video: LiveVideo) -> MainContent
    @ViewBuilder let titleView: () -> TitleContent
    
    @ViewBuilder
    var body: some View {
        VStack {
            titleView()
            
            switch entry.status {
            case .ok:
                if let video = entry.video {
                    mainView(video)
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

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct AppIntentBaseVideoEntryView<MainContent: View, TitleContent: View>: View {
    let entry: AppIntentSingleVideoWidgetEntry
    
    @ViewBuilder let mainView: (_ video: LiveVideo) -> MainContent
    @ViewBuilder let titleView: () -> TitleContent
    
    @ViewBuilder
    var body: some View {
        VStack {
            titleView()
                .unredacted()
            
            switch entry.status {
            case .ok:
                if let video = entry.video {
                    mainView(video)
                } else {
                    NoStreamView()
                }
            case .noVideo:
                NoStreamView()
            case .network:
                NetworkErrorView()
            }
        }
        .containerBackground(for: .widget) {
        }
    }
}
