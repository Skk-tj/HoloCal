//
//  DataStatusIndicator.swift
//  holo-wtf
//
//
//

import SwiftUI

/// The view that represents the view model's network status
///
/// If the status of the network is loading, it will show a ProgressView.
/// Otherwise, the content view (customizable) will be shown.
struct DataStatusIndicatorView<Content: View>: View {
    /// The data status property from VideoViewModel and its subclasses.
    let dataStatus: DataStatus
    var error: VideoFetchServiceError?
    
    /// The view to be shown after the data finishes loading.
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        switch dataStatus {
        case .working:
            ProgressView()
        case .success:
            content()
        case .fail:
            VStack {
                Label("FAILED_TO_RETRIEVE_NEW_DATA", systemImage: "exclamationmark.circle.fill")
                if let error {
                    Text(error.errorDescription ?? "")
                }
            }
            .foregroundColor(.secondary)
        }
    }
}

struct DataStatusIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DataStatusIndicatorView(dataStatus: .working) {
            Text("LIVE_VIEW_CURRENT_COUNT")
        }
        
        DataStatusIndicatorView(dataStatus: .fail, error: .apiUrlError) {
            Text("LIVE_VIEW_CURRENT_COUNT")
        }
    }
}
