//
//  VideoCardFavouriteListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct VideoUIFavouriteListView: View {
    @EnvironmentObject var video: VideoViewModel
    
    let videoType: VideoType
    let uiMode: UIMode
    
    var body: some View {
        UIFavouriteListView(elementView: { video in
            switch videoType {
            case .live:
                switch uiMode {
                case .compact:
                    LiveCellView(live: video)
                case .card:
                    LivePaneView(live: video)
                }
            case .upcoming:
                switch uiMode {
                case .compact:
                    UpcomingCellView(upcoming: video)
                case .card:
                    UpcomingPaneView(upcoming: video)
                }
            case .past:
                switch uiMode {
                case .compact:
                    PastCellView(past: video)
                case .card:
                    PastPaneView(past: video)
                }
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: video.dataStatus) {
                VideoFavouriteCountView(videoType: videoType)
            }
        }, uiMode: uiMode)
    }
}
