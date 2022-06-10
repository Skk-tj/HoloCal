//
//  BaseVideoEntryView.swift
//  holo-wtf-widgetExtension
//
//  Created by Haoyi An on 2022-06-10.
//

import SwiftUI
import WidgetKit

struct BaseVideoEntryView<Content: View, Entry: VideoTimelineEntry>: View {
    var entry: Entry
    var titleText: String
    var noVideoErrorText: String
    var networkErrorText: String
    
    @ViewBuilder let mainView: () -> Content
    
    @ViewBuilder
    var body: some View {
        switch entry.status {
        case .ok:
            mainView()
        case .noVideo:
            VStack {
                HStack {
                    Text(titleText)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text(noVideoErrorText)
                
                Spacer()
            }
        case .network:
            VStack {
                HStack {
                    Text(titleText)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                Spacer()
                
                Text(networkErrorText)
                
                Spacer()
            }
        }
    }
}

//struct BaseVideoEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        BaseVideoEntryView()
//    }
//}
