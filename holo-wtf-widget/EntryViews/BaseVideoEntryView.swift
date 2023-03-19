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

//struct BaseVideoEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        BaseVideoEntryView()
//    }
//}
