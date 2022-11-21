//
//  VideoUIListView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-20.
//

import SwiftUI

struct VideoUIListView: View {
    @Binding var currentPresentationMode: PresentationMode
    @EnvironmentObject var video: VideoViewModel
    
    let videoType: VideoType
    let uiMode: UIMode
    
    var body: some View {
        UIListView(currentPresentationMode: $currentPresentationMode, elementView: { video in
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
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: video.dataStatus) {
                switch videoType {
                case .live:
                    LiveCountView()
                case .upcoming:
                    UpcomingCountView()
                }
            }
        }, uiMode: uiMode)
    }
}
