//
//  BlockUpcomingTimeView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockUpcomingTimeView: View {
    var liveSchedule: Date?
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        BlockVideoInfoView(iconName: "clock", primaryText: {
            if let liveSchedule {
                if liveSchedule < Date() {
                    Text("BLOCK_LIVE_TIME_VIEW_WAITING")
                } else {
                    if isShowingAbsoluteTime {
                        Text(liveSchedule, style: .time)
                    } else {
                        Text(liveSchedule, style: .relative)
                    }
                }
            } else {
                Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME_UNKNOWN")
            }
        }, secondaryText: {
            Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME")
        })
    }
}

struct BlockUpcomingTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockUpcomingTimeView(liveSchedule: Date() + 120, isShowingAbsoluteTime: true)
        BlockUpcomingTimeView(liveSchedule: Date() + 120, isShowingAbsoluteTime: false)
        BlockUpcomingTimeView()
    }
}
