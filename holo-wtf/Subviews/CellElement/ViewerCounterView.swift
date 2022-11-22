//
//  ViewerCounterView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ViewerCounterView: View {
    let viewer: Int
    let memberOnly: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.fill")
                Text(memberOnly ? "N/A" : "\(viewer)")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Text(memberOnly ? "member only" : "watching")
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
