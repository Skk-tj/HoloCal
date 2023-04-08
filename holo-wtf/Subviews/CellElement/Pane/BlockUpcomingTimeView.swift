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
            if isShowingAbsoluteTime {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("\(liveSchedule.formatted(date: .numeric, time: .shortened))")
                }, secondaryText: {
                    Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME")
                })
            } else {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("\(getRelativeTimeString(for: liveSchedule))")
                }, secondaryText: {
                    Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME")
                })
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

struct BlockUpcomingTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockUpcomingTimeView(liveSchedule: Date() + 30000, isShowingAbsoluteTime: true)
        BlockUpcomingTimeView(liveSchedule: Date() + 30000, isShowingAbsoluteTime: false)
        BlockUpcomingTimeView()
    }
}
