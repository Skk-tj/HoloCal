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
    var shortMode: Bool = false
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        if let liveStart = liveTime {
            if isShowingAbsoluteTime {
                Text("LIVE_CELL_VIEW_STARTED_AT \(liveStart.formatted(date: .abbreviated, time: .shortened))")
                    .font(fontSize)
                    .foregroundColor(.secondary)
            } else {
                if let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveStart) {
                    if shortMode {
                        Text("LIVE_CELL_VIEW_STARTED_AGO_SHORT \(elapsedTimeString)")
                            .font(fontSize)
                            .foregroundColor(.secondary)
                    } else {
                        Text("LIVE_CELL_VIEW_STARTED_AGO \(elapsedTimeString)")
                            .font(fontSize)
                            .foregroundColor(.secondary)
                    }
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
        LiveTimeView(liveTime: Date())
    }
}
