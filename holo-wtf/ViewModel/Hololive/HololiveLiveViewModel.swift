//
//  NewLiveViewModel.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-16.
//

import Foundation

@MainActor
class HololiveLiveViewModel: VideoViewModel {
    func getLive() async {
        await getVideo(url: hololiveLiveURL) { responseResult in
            self.videoList = responseResult
            self.videoList.sort(by: liveSortStrategy)
            self.videoList = self.videoList.filter {$0.isHololive}
        }
    }
}