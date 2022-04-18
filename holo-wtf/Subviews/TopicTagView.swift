//
//  TopicTagView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-17.
//

import SwiftUI

struct TopicTagView: View {
    let topicId: String?
    
    var body: some View {
        if let topicId = topicId {
            Text(topicId)
                .padding(5)
                .background(.bar, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}

struct TopicTagView_Previews: PreviewProvider {
    static var previews: some View {
        TopicTagView(topicId: "announce")
    }
}
