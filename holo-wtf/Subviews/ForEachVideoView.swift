//
//  ForEachVideoView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-21.
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
