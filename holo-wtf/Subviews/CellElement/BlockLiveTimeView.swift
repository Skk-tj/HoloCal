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
        VStack(alignment: .leading) {
            if let liveTime, let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveTime) {
                
                if isShowingAbsoluteTime {
                    HStack {
                        Image(systemName: "clock")
                        Text("\(liveTime.formatted(date: .numeric, time: .shortened))")
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

struct BlockLiveTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockLiveTimeView(liveTime: Date() - 30000, isShowingAbsoluteTime: true)
        BlockLiveTimeView(liveTime: Date() - 30000, isShowingAbsoluteTime: false)
        BlockLiveTimeView(liveTime: nil)
    }
}
