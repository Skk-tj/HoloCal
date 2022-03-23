//
//  VideoListViewModel.swift
//  holo-wtf
//
//
//

import Foundation
import OSLog

@MainActor
class VideoListViewModel: ObservableObject {
    @Published var videoList: [LiveVideo]
    @Published var dataStatus: DataStatus
    
    init() {
        self.videoList = []
        self.dataStatus = .working
    }
    
    let logger = Logger()
}
