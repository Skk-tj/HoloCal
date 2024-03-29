//
//  TopicTagView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct TopicTagView: View {
    let topicId: String?
    
    var body: some View {
        if let topicId = topicId {
            Text(topicId)
                .padding(5)
            #if os(iOS)
                .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
            #endif
                .font(.caption)
                .foregroundColor(.secondary)
        }
//        else {
//            Spacer()
//        }
    }
}

struct TopicTagView_Previews: PreviewProvider {
    static var previews: some View {
        TopicTagView(topicId: "announce")
    }
}
