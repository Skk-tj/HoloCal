//
//  NewLiveTimeView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-21.
//

import SwiftUI

struct BlockLiveTimeView: View {
    let liveTime: Date?
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if let liveTime, let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveTime) {
                
                if isShowingAbsoluteTime {
                    HStack {
                        Image(systemName: "clock")
                        Text("\(liveTime.formatted(date: .abbreviated, time: .shortened))")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    
                    Text("BLOCK_LIVE_TIME_VIEW_STARTED_AT")
                        .font(.callout)
                        .foregroundColor(.secondary)
                } else {
                    HStack {
                        Image(systemName: "clock")
                        Text("\(elapsedTimeString)")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    
                    Text("BLOCK_LIVE_TIME_VIEW_AGO")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            } else {
                HStack {
                    Image(systemName: "clock")
                    Text(getTimeIntervalStringFromReferenceDate(reference: Date())!)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
                Text("BLOCK_LIVE_TIME_VIEW_WAITING")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct NewLiveTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockLiveTimeView(liveTime: Date() - 30000)
        BlockLiveTimeView(liveTime: nil)
    }
}
