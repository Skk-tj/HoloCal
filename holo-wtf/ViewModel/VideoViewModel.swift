//
//  VideoViewModel.swift
//  holo-wtf
//
//
//

import Foundation

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
