//
//  UpcomingTimeView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingTimeView: View {
    let liveSchedule: Date?
    var fontSize: Font = .footnote
    var shortMode = false
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        if let liveSchedule {
            if isShowingAbsoluteTime {
                Text("UPCOMING_CELL_VIEW_STARTING_AT \(liveSchedule.formatted(date: .abbreviated, time: .shortened))")
                    .font(fontSize)
                    .foregroundColor(.secondary)
            } else {
                if shortMode {
                    Text(getRelativeTimeString(for: liveSchedule))
                        .font(fontSize)
                        .foregroundColor(.secondary)
                } else {
                    Text("UPCOMING_CELL_VIEW_STARTING_IN \(getRelativeTimeString(for: liveSchedule))")
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
        UpcomingTimeView(liveSchedule: Date() + 50000)
        UpcomingTimeView(liveSchedule: Date() + 50000, shortMode: true)
        UpcomingTimeView(liveSchedule: nil)
    }
}
