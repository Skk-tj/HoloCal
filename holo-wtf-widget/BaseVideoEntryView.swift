//
//  BaseVideoEntryView.swift
//  holo-wtf-widgetExtension
//
//
//

import SwiftUI
import WidgetKit

struct BaseVideoEntryView<MainContent: View, TitleContent: View, Entry: VideoTimelineEntry>: View {
    var entry: Entry
    
    @ViewBuilder let mainView: () -> MainContent
    @ViewBuilder let titleView: () -> TitleContent
    
    @ViewBuilder
    var body: some View {
        VStack {
            titleView()
            
            switch entry.status {
            case .ok:
                mainView()
            case .noVideo:
                NoStreamView()
            case .network:
                Spacer()
                Text("NETWORK_ERROR")
                Spacer()
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
