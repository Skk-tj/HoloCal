//
//  VideoViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-23.
//

import Foundation

enum DataStatus {
    case working
    case success
    case fail
}

enum SortingStrategy: Hashable {
    case notSorting
    case viewersAsc
    case viewersDesc
    case timeAsc
    case timeDesc
}

enum SearchSuggestionCategory {
    case name
    case tag
}

struct SearchSuggestion: Hashable {
    let searchText: String
    let category: SearchSuggestionCategory
}

@MainActor
class VideoViewModel<LiveVideoType: LiveVideo, ChannelType: Channel>: ObservableObject {
    @Published var videoList: [LiveVideoType]
    @Published var dataStatus: DataStatus
    
    init() {
        self.videoList = []
        self.dataStatus = .working
    }
    
    func sortVideos(by strategy: SortingStrategy) {
        switch strategy {
        case .viewersAsc:
            self.videoList.sort(by: {$0.liveViewers < $1.liveViewers})
        case .viewersDesc:
            self.videoList.sort(by: {$0.liveViewers > $1.liveViewers})
        case .timeAsc:
            self.videoList.sort(by: {$0.startActual ?? ($0.startScheduled ?? Date.distantFuture) < $1.startActual ?? ($1.startScheduled ?? Date.distantFuture)})
        case .timeDesc:
            self.videoList.sort(by: {$0.startActual ?? ($0.startScheduled ?? Date.distantFuture) > $1.startActual ?? ($1.startScheduled ?? Date.distantFuture)})
        default:
            return
        }
    }
}
