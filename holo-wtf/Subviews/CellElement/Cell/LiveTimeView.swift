//
//  LiveTimeView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveTimeView: View {
    let liveTime: Date?
    var fontSize: Font = .footnote
    var shortMode = false
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        if let liveStart = liveTime {
            if isShowingAbsoluteTime {
                Text("LIVE_CELL_VIEW_STARTED_AT \(liveStart.formatted(date: .abbreviated, time: .shortened))")
                    .font(fontSize)
                    .foregroundColor(.secondary)
            } else {
                if shortMode {
                    Text(getRelativeTimeString(for: liveStart))
                        .font(fontSize)
                        .foregroundColor(.secondary)
                } else {
                    Text("LIVE_CELL_VIEW_STARTED_AGO \(getRelativeTimeString(for: liveStart))")
                        .font(fontSize)
                        .foregroundColor(.secondary)
                }
            }
        } else {
            Text("LIVE_CELL_VIEW_WAITING")
                .font(fontSize)
                .foregroundColor(.secondary)
        }
    }
}

struct LiveTimeView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTimeView(liveTime: Date() - 30000)
        LiveTimeView(liveTime: Date() - 30000, shortMode: true)
    }
}
