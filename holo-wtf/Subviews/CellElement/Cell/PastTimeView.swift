//
//  PastTimeView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastTimeView: View {
    let endedAt: Date
    var fontSize: Font = .footnote
    var shortMode = false
    
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInPastView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        if isShowingAbsoluteTime {
            Text("PAST_CELL_VIEW_ENDED_AT \(endedAt.formatted(date: .numeric, time: .shortened))")
                .font(fontSize)
                .foregroundColor(.secondary)
        } else {
            if shortMode {
                Text(getRelativeTimeString(for: endedAt))
                    .font(fontSize)
                    .foregroundColor(.secondary)
            } else {
                Text("PAST_CELL_VIEW_ENDED \(getRelativeTimeString(for: endedAt))")
                    .font(fontSize)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct PastTimeView_Previews: PreviewProvider {
    static var previews: some View {
        PastTimeView(endedAt: Date() - 3800)
        PastTimeView(endedAt: Date() - 3800, shortMode: true)
    }
}
