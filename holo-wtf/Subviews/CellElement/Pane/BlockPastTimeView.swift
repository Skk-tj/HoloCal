//
//  BlockPastTimeView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockPastTimeView: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInPastView) var isShowingAbsoluteTime: Bool = false
    
    let endedAt: Date
    
    var body: some View {
        if let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: endedAt) {
            if isShowingAbsoluteTime {
                BlockVideoInfoView(iconName: "clock.arrow.circlepath", primaryText: {
                    Text(endedAt.formatted(date: .numeric, time: .shortened))
                }, secondaryText: {
                    Text("BLOCK_PAST_TIME_VIEW_ENDED_AT")
                })
            } else {
                BlockVideoInfoView(iconName: "clock.arrow.circlepath", primaryText: {
                    Text(elapsedTimeString)
                }, secondaryText: {
                    Text("BLOCK_PAST_TIME_VIEW_AGO")
                })
            }
        } else {
            BlockVideoInfoView(iconName: "clock.arrow.circlepath", primaryText: {
                Text("N/A")
            }, secondaryText: {
                Text("BLOCK_PAST_TIME_VIEW_AGO")
            })
        }
    }
}

struct BlockPastTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockPastTimeView(endedAt: Date() - 3000)
    }
}
