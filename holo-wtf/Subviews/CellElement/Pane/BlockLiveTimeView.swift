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
        if let liveTime {
            if isShowingAbsoluteTime {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("\(liveTime.formatted(date: .numeric, time: .shortened))")
                }, secondaryText: {
                    Text("BLOCK_LIVE_TIME_VIEW_TIME_STARTED")
                })
            } else {
                BlockVideoInfoView(iconName: "clock", primaryText: {
                    Text("\(getRelativeTimeString(for: liveTime))")
                }, secondaryText: {
                    Text("BLOCK_LIVE_TIME_VIEW_TIME_STARTED")
                })
            }
        } else {
            BlockVideoInfoView(iconName: "clock", primaryText: {
                Text("BLOCK_LIVE_TIME_VIEW_WAITING")
            }, secondaryText: {
                Text("BLOCK_LIVE_TIME_VIEW_TIME_STARTED")
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
