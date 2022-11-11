//
//  LiveCollabListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveCollabListView: View {
    @Environment(\.dismiss) var dismiss
    let mentions: [Channel]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(mentions, id: \.id) { channel in
                    HStack {
                        LiveAvatarView(url: channel.photo, avatarRadius: 64)
                        
                        VStack(alignment: .leading) {
                            Text(channel.getTalentName())
                            
                            Text(channel.name)
                                .foregroundColor(.secondary)
                                .font(.caption)
                            
                            Divider()
                            
                            Text(channel.getTalentGenerationName())
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("COLLAB_SHEET_NAVIGATION_TITLE")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("COLLAB_SHEET_DISMISS_BUTTON", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct LiveCollabListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LiveCollabListView(mentions: [Channel.testChannel, Channel.testChannel2])
        }
    }
}
