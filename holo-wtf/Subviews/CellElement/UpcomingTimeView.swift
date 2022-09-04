//
//  UpcomingTimeView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingTimeView: View {
    var liveSchedule: Date?
    var fontSize: Font = .footnote
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        if let liveSchedule = liveSchedule {
            if isShowingAbsoluteTime {
                Text("UPCOMING_CELL_VIEW_STARTING_AT \(liveSchedule.formatted(date: .abbreviated, time: .shortened))")
                    .font(fontSize)
                    .foregroundColor(.secondary)
            } else {
                if let futureTimeString = getTimeIntervalStringFromReferenceDate(reference: liveSchedule) {
                    Text("UPCOMING_CELL_VIEW_STARTING_IN \(futureTimeString)")
                        .font(fontSize)
                        .foregroundColor(.secondary)
                }
            }
        } else {
            Text("UPCOMING_CELL_VIEW_STARTING_TIME_UNKNOWN")
                .font(fontSize)
                .foregroundColor(.secondary)
        }
    }
}

struct UpcomingTimeView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingTimeView(liveSchedule: Date())
    }
}
