//
//  LiveCollabListStackView.swift
//  holo-wtf
//
//
//

import SwiftUI

@available(iOS 16.0, *)
struct LiveCollabListStackView: View {
    @Environment(\.dismiss) var dismiss
    let mentions: [Channel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mentions) { channel in
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

struct LiveCollabListStackView_Previews: PreviewProvider {
    static var previews: some View {
        LiveCollabListView(mentions: [Channel.testChannel, Channel.testChannel2])
    }
}
