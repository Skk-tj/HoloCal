//
//  LiveTimeView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveTimeView: View {
    let liveTime: Date?
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        if let liveStart = liveTime {
            if isShowingAbsoluteTime {
                Text("LIVE_CELL_VIEW_STARTED_AT \(liveStart.formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else {
                if let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveStart) {
                    Text("LIVE_CELL_VIEW_STARTED_AGO \(elapsedTimeString)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        } else {
            Text("LIVE_CELL_VIEW_WAITING")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

struct LiveTimeView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTimeView(liveTime: Date())
    }
}
