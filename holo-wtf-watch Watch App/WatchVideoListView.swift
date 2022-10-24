//
//  WatchVideoListView.swift
//  holo-wtf-watch Watch App
//
//  Created by Haoyi An on 2022-09-18.
//

import SwiftUI

struct WatchVideoListView<VideoContent: View, DataStatusContent: View, LiveVideoType: LiveVideo, ChannelType: Channel, VM: VideoViewModel<LiveVideoType, ChannelType>>: View {
    @EnvironmentObject var viewModel: VM
    
    /// The view of a single video.
    @ViewBuilder let singleVideoView: (_ live: any LiveVideo) -> VideoContent
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        List {
            ForEach(viewModel.videoList, id: \.self) { video in
                singleVideoView(video)
            }
            
            HStack {
                Spacer()
                dataStatusView()
                Spacer()
            }
        }
    }
}
//struct WatchVideoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchVideoListView()
//    }
//}
