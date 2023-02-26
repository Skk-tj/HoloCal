//
//  ChannelNameView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ChannelNameView: View {
    let channel: Channel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(channel.getTalentName())
                .lineLimit(1)
                .font(.subheadline)
                .fontWeight(.bold)
            Text(channel.getAltTalentName())
                .lineLimit(1)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct ChannelNameView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelNameView(channel: Channel.testChannel)
    }
}
