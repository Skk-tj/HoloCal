//
//  LivePaneView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LivePaneView: View {
    let live: LiveVideo
    
    @State var isShowingCollabSheet: Bool = false
    
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    @State var liveIconOpcality: Double = 0
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VideoThumbnailView(ytVideoKey: live.id)
                
                VStack(alignment: .leading) {
                    // MARK: - Stream title
                    // Force the title to be two lines
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        Text(live.title)
                            .font(.headline)
                            .frame(maxHeight: .infinity)
                            .lineLimit(2, reservesSpace: true)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text(live.title)
                            .font(.headline)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }
                    
                    // MARK: - Channel information
                    PaneViewChannelInfoView(video: live)
                    
                    // MARK: - Time and other information
                    HStack {
                        ViewerCounterView(viewer: live.liveViewers, memberOnly: live.isMengen)
                            .padding(.trailing)
                        
                        BlockLiveTimeView(liveTime: live.startActual)
                    }
                    .padding(.top, 5)
                    
                    Divider()
                    
                    PaneViewButtonRowView(video: live)
                        .padding(.top)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            
            
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
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct LivePaneView_Previews: PreviewProvider {
    static var previews: some View {
        LivePaneView(live: LiveVideo.previewLive)
        LivePaneView(live: LiveVideo.previewLive).preferredColorScheme(.dark)
    }
}
