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
                switch videoType {
                case .live:
                    LiveCountView()
                case .upcoming:
                    UpcomingCountView()
                case .past:
                    PastCountView()
                }
            }
        }, uiMode: uiMode)
    }
}
