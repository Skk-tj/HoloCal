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
                if isFavourite {
                    VideoFavouriteCountView(videoType: videoType)
                } else {
                    VideoCountView(videoType: videoType)
                }
            }
        }, uiMode: uiMode)
    }
}
