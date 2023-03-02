//
//  PastPaneView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastPaneView: View {
    let past: LiveVideo
    
    @State var isShowingCollabSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: past.id)
                
                VStack(alignment: .leading) {
                    VideoTitleView(title: past.title)
                    
                    PaneViewChannelInfoView(video: past)
                    
                    // MARK: - Time and other information
                    HStack {
                        BlockPastTimeView(endedAt: past.endedAt)
                            .padding(.trailing)
                        if past.isMengen {
                            BlockMemberOnlyView()
                                .padding(.trailing)
                        }
                    }
                    .padding(.top, 5)
                    
                    Divider()
                    
                    PaneViewButtonRowView(video: past, showCalendar: false)
                        .padding(.top)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            
            HStack {
                TopicTagView(topicId: past.topicId)
                    .padding()
                
                Spacer()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct PastPaneView_Previews: PreviewProvider {
    static var previews: some View {
        PastPaneView(past: LiveVideo.previewLive)
    }
}
