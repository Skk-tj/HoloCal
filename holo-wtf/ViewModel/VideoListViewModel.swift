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
    @Published var isSuccess: Bool
    @Published var dataStatus: DataStatus
    
    init() {
        self.videoList = []
        self.isSuccess = true
        self.dataStatus = .working
    }
    
    let logger = Logger()
}
