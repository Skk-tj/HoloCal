//
//  LiveCellView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCellView: View {
    let live: LiveVideo
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        HStack {
            LiveAvatarView(url: live.channel.photo)
            VStack(alignment: .leading) {
                Text(live.escapedTitle)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.bottom, 5)
                
                TopicTagView(topicId: live.topicId)
                
                HStack {                    
                    Text(live.channel.name)
                        .font(.subheadline)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                    
                    if favourited.contains(where: {$0 == live.channel.id}) {
                        Image(systemName: "star.fill")
                            .tint(.yellow)
                    }
                }
                
                Divider()
                HStack {
                    if live.isMengen {
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    } else {
                        Text("LIVE_CELL_VIEW_PEOPLE_WATCHING \(live.liveViewers)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    LiveTimeView(liveTime: live.startActual)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
}

struct LiveCellView_Previews: PreviewProvider {
    static var previews: some View {
        LiveCellView(live: LiveVideo.previewLive)
        LiveCellView(live: LiveVideo.previewLiveMemberOnly)
    }
}
