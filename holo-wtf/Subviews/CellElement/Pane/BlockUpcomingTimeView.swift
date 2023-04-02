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
        if let liveSchedule, let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveSchedule) {
            
            if isShowingAbsoluteTime {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("\(liveSchedule.formatted(date: .numeric, time: .shortened))")
                }, secondaryText: {
                    Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_AT")
                })
            } else {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("\(elapsedTimeString)")
                }, secondaryText: {
                    Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_IN")
                })
            }
            
        } else {
            BlockVideoInfoView(iconName: "clock", primaryText: {
                Text(getTimeIntervalStringFromReferenceDate(reference: Date())!)
            }, secondaryText: {
                Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME_UNKNOWN")
            })
        }
    }
}

struct BlockUpcomingTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockUpcomingTimeView(liveSchedule: Date() - 30000, isShowingAbsoluteTime: true)
        BlockUpcomingTimeView(liveSchedule: Date() - 30000, isShowingAbsoluteTime: false)
        BlockUpcomingTimeView()
    }
}
