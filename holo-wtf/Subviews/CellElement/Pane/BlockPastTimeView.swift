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
        if isShowingAbsoluteTime {
            BlockVideoInfoView(iconName: "clock.arrow.circlepath", primaryText: {
                Text(endedAt.formatted(date: .numeric, time: .shortened))
            }, secondaryText: {
                Text("BLOCK_PAST_TIME_VIEW_TIME_ENDED")
            })
        } else {
            BlockVideoInfoView(iconName: "clock.arrow.circlepath", primaryText: {
                Text(getRelativeTimeString(for: endedAt))
            }, secondaryText: {
                Text("BLOCK_PAST_TIME_VIEW_TIME_ENDED")
            })
        }
    }
}

struct BlockPastTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockPastTimeView(endedAt: Date() - 3000)
    }
}
