//
//  BaseVideoEntryView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-06-10.
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
                Spacer()
                Text("NO_ONE_IS_STREAMING")
                Spacer()
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
