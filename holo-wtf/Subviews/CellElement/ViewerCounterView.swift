//
//  ViewerCounterView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-21.
//

import SwiftUI

struct ViewerCounterView: View {
    let viewer: Int
    let memberOnly: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.fill")
                Text(memberOnly ? "VIEWER_COUNTER_VIEW_MEMBER_NA" : "\(viewer)")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Text(memberOnly ? "VIEWER_COUNTER_VIEW_MEMBER_ONLY" : "VIEWER_COUNTER_VIEW_WATCHING")
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}

struct ViewerCounterView_Previews: PreviewProvider {
    static var previews: some View {
        ViewerCounterView(viewer: 12345, memberOnly: false)
        ViewerCounterView(viewer: 12345, memberOnly: true)
    }
}
