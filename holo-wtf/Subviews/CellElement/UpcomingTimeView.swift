//
//  UpcomingTimeView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct UpcomingTimeView: View {
    var liveSchedule: Date?
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        if let liveSchedule = liveSchedule {
            if isShowingAbsoluteTime {
                Text("UPCOMING_CELL_VIEW_STARTING_AT \(liveSchedule.formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            } else {
                if let futureTimeString = getTimeIntervalStringFromReferenceDate(reference: liveSchedule) {
                    Text("UPCOMING_CELL_VIEW_STARTING_IN \(futureTimeString)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        } else {
            Text("UPCOMING_CELL_VIEW_STARTING_TIME_UNKNOWN")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

struct UpcomingTimeView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingTimeView(liveSchedule: Date())
    }
}
