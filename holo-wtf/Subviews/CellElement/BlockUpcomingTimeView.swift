//
//  BlockUpcomingTimeView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-23.
//

import SwiftUI

struct BlockUpcomingTimeView: View {
    var liveSchedule: Date?
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if let liveSchedule, let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveSchedule) {
                
                if isShowingAbsoluteTime {
                    HStack {
                        Image(systemName: "clock")
                        Text("\(liveSchedule.formatted(date: .numeric, time: .shortened))")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    
                    Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_AT")
                        .font(.callout)
                        .foregroundColor(.secondary)
                } else {
                    HStack {
                        Image(systemName: "clock")
                        Text("\(elapsedTimeString)")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    
                    Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_IN")
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
                
                Text("BLOCK_UPCOMING_TIME_VIEW_STARTING_TIME_UNKNOWN")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct BlockUpcomingTimeView_Previews: PreviewProvider {
    static var previews: some View {
        BlockUpcomingTimeView()
    }
}
