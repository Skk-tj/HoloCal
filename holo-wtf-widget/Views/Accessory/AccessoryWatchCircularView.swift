//
//  AccessoryWatchCircularView.swift
//  holo-wtf
//
//
//

import SwiftUI
import WidgetKit

struct AccessoryWatchCircularView: View {
    let count: Int
    let videoType: VideoType
    
    var body: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack {
                switch videoType {
                case .live:
                    Image(systemName: "person.wave.2.fill")
                        .font(.caption2)
                case .upcoming:
                    Image(systemName: "clock")
                        .font(.caption2)
                case .past:
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.caption2)
                }
                
                Text("\(count)")
                    .font(.title)
                    .widgetAccentable()
            }
        }
    }
}

struct AccessoryWatchCircularView_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryWatchCircularView(count: 4, videoType: .upcoming)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
        
        AccessoryWatchCircularView(count: 5, videoType: .live)
            .previewDevice(PreviewDevice(rawValue: "Apple Watch Ultra (49mm)"))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
