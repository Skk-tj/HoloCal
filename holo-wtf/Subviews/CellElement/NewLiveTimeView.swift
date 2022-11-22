//
//  NewLiveTimeView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-21.
//

import SwiftUI

struct NewLiveTimeView: View {
    let liveTime: Date?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let liveTime, let elapsedTimeString = getTimeIntervalStringFromReferenceDate(reference: liveTime) {
                HStack {
                    Image(systemName: "clock")
                    Text("\(elapsedTimeString)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
                Text("ago")
                    .font(.callout)
                    .foregroundColor(.secondary)
            } else {
                HStack {
                    Image(systemName: "clock")
                    Text("N/A")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
                Text("waiting...")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct NewLiveTimeView_Previews: PreviewProvider {
    static var previews: some View {
        NewLiveTimeView(liveTime: Date() - 30000)
        NewLiveTimeView(liveTime: nil)
    }
}
