//
//  UpcomingPaneView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-24.
//

import SwiftUI

struct UpcomingPaneView: View {
    var upcoming: LiveVideo
    
    @State var isShowingCollabSheet: Bool = false
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: upcoming.id)
                
                VStack(alignment: .leading) {
                    // Force the title to be two lines
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        Text(upcoming.title + "\n")
                            .font(.headline)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text(upcoming.title)
                            .font(.headline)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }
                    
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
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                TopicTagView(topicId: upcoming.topicId)
                    .padding()
                
                Spacer()
                
                if favourited.contains(where: {$0 == upcoming.channel.id}) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow) // iOS needs it cause plain list style does not show tint
                        .tint(.yellow)
                        .padding()
                        .shadow(radius: 5)
                }
            }
        }
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
