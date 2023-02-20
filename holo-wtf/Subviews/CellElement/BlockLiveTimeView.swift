//
//  NewLiveTimeView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockLiveTimeView: View {
    let liveTime: Date?
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        if let liveTime, let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveTime) {
            if isShowingAbsoluteTime {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("\(liveTime.formatted(date: .numeric, time: .shortened))")
                }, secondaryText: {
                    Text("BLOCK_LIVE_TIME_VIEW_STARTED_AT")
                })
            } else {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("\(elapsedTimeString)")
                }, secondaryText: {
                    Text("BLOCK_LIVE_TIME_VIEW_STARTED_AT")
                })
            }
        } else {
            BlockVideoInfoView(iconName: "clock", primaryText: {
                Text(getTimeIntervalStringFromReferenceDate(reference: Date())!)
            }, secondaryText: {
                Text("BLOCK_LIVE_TIME_VIEW_WAITING")
            })
        }
    }
}

struct BlockLiveTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockLiveTimeView(liveTime: Date() - 30000, isShowingAbsoluteTime: true)
        BlockLiveTimeView(liveTime: Date() - 30000, isShowingAbsoluteTime: false)
        BlockLiveTimeView(liveTime: nil)
    }
}
