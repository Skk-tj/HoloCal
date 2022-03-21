//
//  VideoListViewModel.swift
//  holo-wtf
//
//  Created by Henry An on 2022-03-20.
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
