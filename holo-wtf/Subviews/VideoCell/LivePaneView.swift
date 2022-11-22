//
//  LivePaneView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-23.
//

import SwiftUI

struct LivePaneView: View {
    let live: LiveVideo
    
    @State var isShowingCollabSheet: Bool = false
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @State var liveIconOpcality: Double = 0
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: live.id)
                
                VStack(alignment: .leading) {
                    // MARK: - Stream title
                    // Force the title to be two lines
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        Text(live.title + "\n")
                            .font(.headline)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text(live.title)
                            .font(.headline)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }
                    
                    // MARK: - Channel information
                    HStack {
                        LiveAvatarView(url: live.channel.photo, avatarRadius: 40.0)
                        
                        if let mentions = live.mentions {
                            Text("\(live.channel.name) \(String(localized: "LIVE_PANE_VIEW_WITH"))")
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            LiveCollabAvatarView(mentions: mentions, avatarRadius: 40.0)
                                .onTapGesture {
                                    isShowingCollabSheet.toggle()
                                }
                                .sheet(isPresented: $isShowingCollabSheet, content: {
                                    if #available(iOS 16.0, *) {
                                        LiveCollabListStackView(mentions: mentions)
                                            .presentationDetents([.medium, .large])
                                    } else {
                                        LiveCollabListView(mentions: mentions)
                                    }
                                })
                        } else {
                            Text(live.channel.name)
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    // MARK: - Time and other information
                    HStack {
                        ViewerCounterView(viewer: live.liveViewers, memberOnly: live.isMengen)
                            .padding(.trailing)
                        
                        NewLiveTimeView(liveTime: live.startActual)
                    }
                    .padding(.top, 5)
                    
                    Divider()
                    
                    PaneViewButtonRowView(video: live)
                        .padding(.top)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // MARK: - Live icon and tags
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HStack(alignment: .top, spacing: 2) {
                        Image(systemName: "circle.fill")
                            .onAppear {
                                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                    liveIconOpcality = 1
                                }
                            }
                            .opacity(liveIconOpcality)
                        Text("LIVE")
                    }
                        .padding(5)
                        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.top)
                        .padding(.leading)
                    TopicTagView(topicId: live.topicId)
                        .padding(.leading)
                }
                
                Spacer()
            }
        }
    }
}

struct LivePaneView_Previews: PreviewProvider {
    static var previews: some View {
        LivePaneView(live: LiveVideo.previewLive)
        LivePaneView(live: LiveVideo.previewLive).preferredColorScheme(.dark)
    }
}
