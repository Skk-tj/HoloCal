//
//  VideoWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct VideoWatchView: View {
    @StateObject var video: VideoViewModel
    let agency: AgencyEnum
    let videoType: VideoType
    
    init(for agency: AgencyEnum, videoType: VideoType) {
        self.agency = agency
        self.videoType = videoType
        _video = StateObject(wrappedValue: VideoViewModel(for: agency, videoType: videoType))
    }
    
    var body: some View {
        WatchVideoListView(singleVideoView: { video in
            NavigationLink(destination: {
                SingleVideoWatchView(video: video, videoType: videoType)
            }, label: {
                WatchVideoCellView(video: video, videoType: videoType)
            })
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: video.dataStatus) {
                VideoCountView(videoType: videoType)
                    .font(.footnote)
                    .environmentObject(video)
            }
        })
        .navigationTitle(agency.getAgency().localizedName)
        .environmentObject(video)
        .task {
            switch videoType {
            case .live:
                video.sortingStrategy = .timeDesc
            case .upcoming:
                video.sortingStrategy = .timeAsc
            case .past:
                video.sortingStrategy = .endedFirst
            }
            
            await video.getVideoForUI()
        }
        .refreshable {
            switch videoType {
            case .live:
                video.sortingStrategy = .timeDesc
            case .upcoming:
                video.sortingStrategy = .timeAsc
            case .past:
                video.sortingStrategy = .endedFirst
            }
            
            await video.getVideoForUI()
        }
        .toolbar {
            if #available(watchOS 10.0, *) {
                if videoType == .live {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                if video.sortingStrategy == .timeDesc {
                                    video.sortingStrategy = .viewersDesc
                                } else {
                                    video.sortingStrategy = .timeDesc
                                }
                                
                                self.video.sortVideos()
                            }
                        }, label: {
                            Image(systemName: video.sortingStrategy == .timeDesc ? "hourglass.tophalf.filled" : "person.fill")
                        })
                        .contentTransition(.symbolEffect(.replace))
                    }
                }
            } else {
                ToolbarItem {}
            }
        }
    }
}
