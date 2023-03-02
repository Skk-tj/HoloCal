//
//  UpcomingPaneView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingPaneView: View {
    var upcoming: LiveVideo
    
    @State var isShowingCollabSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: upcoming.id)
                
                VStack(alignment: .leading) {
                    VideoTitleView(title: upcoming.title)
                    
                    PaneViewChannelInfoView(video: upcoming)
                    
                    // MARK: - Time and other information
                    HStack {
                        BlockUpcomingTimeView(liveSchedule: upcoming.startScheduled)
                            .padding(.trailing)
                        if upcoming.isMengen {
                            BlockMemberOnlyView()
                                .padding(.trailing)
                        }
                        if upcoming.isPremiere {
                            BlockVideoTypeView()
                        }
                    }
                    .padding(.top, 5)
                    
                    Divider()
                    
                    PaneViewButtonRowView(video: upcoming, showCalendar: true)
                        .padding(.top)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            
            HStack {
                TopicTagView(topicId: upcoming.topicId)
                    .padding()
                
                Spacer()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct UpcomingPaneView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingPaneView(upcoming: LiveVideo.previewLive)
        UpcomingPaneView(upcoming: LiveVideo.previewLiveMemberOnly)
        UpcomingPaneView(upcoming: LiveVideo.previewLive)
            .environment(\.locale, .init(identifier: "ja"))
        UpcomingPaneView(upcoming: LiveVideo.previewLiveMemberOnly)
            .environment(\.locale, .init(identifier: "ja"))
    }
}
