//
//  DataStatusIndicator.swift
//  holo-wtf
//
//
//

import SwiftUI

struct DataStatusIndicatorView<Content: View>: View {
    let dataStatus: DataStatus
    let content: () -> Content
    
    init(dataStatus: DataStatus, @ViewBuilder content: @escaping () -> Content) {
        self.dataStatus = dataStatus
        self.content = content
    }
    
    var body: some View {
        if (dataStatus == .fail) {
            Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                .foregroundColor(.secondary)
        } else {
            if (dataStatus == .working) {
                ProgressView()
            } else {
                content()
            }
        }
    }
}

struct DataStatusIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DataStatusIndicatorView(dataStatus: .working) {
            Text("LIVE_VIEW_CURRENT_COUNT")
        }
    }
}
