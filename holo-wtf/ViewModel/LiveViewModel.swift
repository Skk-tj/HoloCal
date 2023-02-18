//
//  NewLiveViewModel.swift
//  holo-wtf
//
//
//

import Foundation

class LiveViewModel: VideoViewModel, VideoGettable {
    let videoUrl: String
    
    override init(for agency: AgencyEnum) {
        self.videoUrl = getLiveUrl(for: agency)
        super.init(for: agency)
    }
    
    @MainActor
    func getVideoForUI() async {
        await getVideo(url: videoUrl) { responseResult in
            self.videoList = responseResult
            self.sortVideos()
            self.videoList = self.videoList.filter {
                $0.isAgency(agency: self.agency)
            }
        }
    }
}
