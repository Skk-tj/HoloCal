//
//  LiveTimeView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct LiveTimeView: View {
    let liveTime: Date?
    
    @Binding var isShowingAbsoluteTime: Bool
    
    var body: some View {
        if let liveStart = liveTime {
            if isShowingAbsoluteTime {
                Text("LIVE_CELL_VIEW_STARTED_AT \(getAbsoluteDateFormatter().string(from: liveStart))")
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
        LiveTimeView(liveTime: Date(), isShowingAbsoluteTime: Binding.constant(true))
        LiveTimeView(liveTime: Date(), isShowingAbsoluteTime: Binding.constant(false))
    }
}
