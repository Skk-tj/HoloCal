//
//  LivePaneView.swift
//  holo-wtf
//
//
//

import SwiftUI
import HTMLString

struct LivePaneView: View {
    let live: LiveVideo
    
    @Binding var isShowingCollabSheet: Bool
    @Binding var collabChannels: [Channel]
    
    @AppStorage("favouritedChannel") var favourited = Favourited()
    @State var liveIconOpcality: Double = 0
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: live.id)
                
                VStack(alignment: .leading) {
                    Text(live.escapedTitle)
                        .font(.headline)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        LiveAvatarView(url: live.channel.photo, avatarRadius: 40.0)
                        
                        if let mentions = live.mentions {
                            Text("\(live.channel.name) \(String(localized: "LIVE_PANE_VIEW_WITH"))")
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            LiveCollabAvatarView(mentions: mentions, avatarRadius: 40.0)
                                .onTapGesture {
                                    isShowingCollabSheet = true
                                    collabChannels = mentions
                                }
                        } else {
                            Text(live.channel.name)
                                .lineLimit(1)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        if live.isMengen {
                            Text("LIVE_CELL_VIEW_MEMBER_ONLY_STREAM")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        } else {
                            Text("LIVE_CELL_VIEW_PEOPLE_WATCHING \(live.liveViewers)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        LiveTimeView(liveTime: live.startActual)
                            .multilineTextAlignment(.trailing)
                    }
                    .padding(.bottom)
                    
                    PaneViewButtonRowView(video: live)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
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
                
                if favourited.contains(where: {$0 == live.channel.id}) {
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

struct LivePaneView_Previews: PreviewProvider {
    static var previews: some View {
        LivePaneView(live: LiveVideo.previewLive, isShowingCollabSheet: Binding.constant(false), collabChannels: Binding.constant([Channel.testChannel]))
        LivePaneView(live: LiveVideo.previewLive, isShowingCollabSheet: Binding.constant(false), collabChannels: Binding.constant([Channel.testChannel])).preferredColorScheme(.dark)
    }
}
