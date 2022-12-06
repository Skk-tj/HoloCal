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
    
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: upcoming.id)
                
                VStack(alignment: .leading) {
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        Text(upcoming.title)
                            .font(.headline)
                            .frame(maxHeight: .infinity)
                            .lineLimit(2, reservesSpace: true)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text(upcoming.title)
                            .font(.headline)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }
                    
                    // MARK: - Channel information
                    PaneViewChannelInfoView(video: upcoming)
                    
                    // MARK: - Time and other information
                    HStack {
                        if upcoming.isMengen {
                            BlockUpcomingTimeView(liveSchedule: upcoming.startScheduled)
                                .padding(.trailing)
                            BlockMemberOnlyView()
                        }
                        else {
                            BlockUpcomingTimeView(liveSchedule: upcoming.startScheduled)
                        }
                    }
                    .padding(.top, 5)
                    
                    Divider()
                    
                    PaneViewButtonRowView(video: upcoming)
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
