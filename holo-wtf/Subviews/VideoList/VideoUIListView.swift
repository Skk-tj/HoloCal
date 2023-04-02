//
//  VideoUIListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoUIListView: View {
    @Binding var currentPresentationMode: PresentationMode
    @EnvironmentObject var video: VideoViewModel
    
    let videoType: VideoType
    let uiMode: UIMode
    let isFavourite: Bool
    
    var body: some View {
        UIListView(currentPresentationMode: $currentPresentationMode, isFavourite: isFavourite, elementView: { video in
            switch uiMode {
            case .compact:
                VideoCellView(video: video, videoType: videoType)
            case .card:
                VideoPaneView(video: video, videoType: videoType)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: video.dataStatus) {
                if isFavourite {
                    VideoFavouriteCountView(videoType: videoType)
                } else {
                    VideoCountView(videoType: videoType)
                }
            }
        }, uiMode: uiMode)
    }
}
