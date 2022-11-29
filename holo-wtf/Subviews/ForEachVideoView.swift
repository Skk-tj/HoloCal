//
//  ForEachVideoView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ForEachVideoView<Content: View>: View {
    @EnvironmentObject var viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        ForEach(viewModel.videoList) { live in
            cellView(live)
        }
    }
}
