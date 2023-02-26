//
//  PastCellView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastCellView: View {
    let past: LiveVideo
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    var body: some View {
        HStack {
            LiveAvatarView(url: past.channel.photo)
            
            VStack(alignment: .leading) {
                Text(past.title)
                    .font(.headline)
                    .lineLimit(1)
                    .padding(.bottom, 5)
                
                TopicTagView(topicId: past.topicId)
                
                HStack {
                    Text(past.channel.name)
                        .font(.subheadline)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                    
                    if favourited.contains(where: {$0 == past.channel.id}) {
                        Image(systemName: "star.fill")
                            .tint(.yellow)
                    }
                }
                Divider()
                HStack {
                    PastTimeView(endedAt: past.endedAt)
                    if past.isMengen {
                        Spacer()
                        Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

struct PastCellView_Previews: PreviewProvider {
    static var previews: some View {
        PastCellView(past: LiveVideo.previewLive)
        PastCellView(past: LiveVideo.previewLiveMemberOnly)
    }
}
