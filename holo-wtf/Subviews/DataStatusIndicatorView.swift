//
//  DataStatusIndicator.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-24.
//

import SwiftUI

/// The view that represents the view model's network status
///
/// If the status of the network is loading, it will show a ProgressView.
/// Otherwise, the content view (customizable) will be shown.
struct DataStatusIndicatorView<Content: View>: View {
    /// The data status property from VideoViewModel and its subclasses.
    let dataStatus: DataStatus
    
    /// The view to be shown after the data finishes loading.
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        switch dataStatus {
        case .working:
            ProgressView()
        case .success:
            content()
        case .fail:
            Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                .foregroundColor(.secondary)
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
