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
        if let liveSchedule {
            if liveSchedule < Date() {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("BLOCK_LIVE_TIME_VIEW_WAITING")
                }, secondaryText: {
                    Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME")
                })
            } else {
                if isShowingAbsoluteTime {
                    BlockVideoInfoView(iconName: "clock", primaryText: {
                        Text(liveSchedule, style: .time)
                    }, secondaryText: {
                        Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME")
                    })
                } else {
                    BlockVideoInfoView(iconName: "clock", primaryText: {
                        Text(liveSchedule, style: .relative)
                    }, secondaryText: {
                        Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_IN")
                    })
                }
            }
        } else {
            BlockVideoInfoView(iconName: "clock", primaryText: {
                Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME_UNKNOWN")
            }, secondaryText: {
                Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME")
            })
        }
    }
}

#Preview {
    BlockUpcomingTimeView(liveSchedule: Date() + 120, isShowingAbsoluteTime: true)
}

#Preview {
    BlockUpcomingTimeView(liveSchedule: Date() + 120, isShowingAbsoluteTime: false)
}

#Preview {
    BlockUpcomingTimeView()
}
