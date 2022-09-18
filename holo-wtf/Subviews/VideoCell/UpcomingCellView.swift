//
//  UpcomingCellView.swift
//  holo-wtf
//
//  Created by Henry An on 2021-12-22.
//

import SwiftUI

struct UpcomingCellView: View {
    let upcoming: LiveVideo
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        HStack {
            LiveAvatarView(url: upcoming.channel.photo)
            VStack(alignment: .leading) {
                Text(upcoming.title)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.bottom, 5)
                
                TopicTagView(topicId: upcoming.topicId)
                
                HStack {
                    Text(upcoming.channel.name)
                        .font(.subheadline)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                    
                    if favourited.contains(where: {$0 == upcoming.channel.id}) {
                        Image(systemName: "star.fill")
                            .tint(.yellow)
                    }
                }
                Divider()
                HStack {
                    UpcomingTimeView(liveSchedule: upcoming.startScheduled)
                    if upcoming.isMengen {
                        Spacer()
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .contextMenu {
            VideoContextMenu(video: upcoming)
        }
    }
}

struct UpcomingCellView_Previews: PreviewProvider {    
    static var previews: some View {
        UpcomingCellView(upcoming: LiveVideo.previewLive)
    }
}
