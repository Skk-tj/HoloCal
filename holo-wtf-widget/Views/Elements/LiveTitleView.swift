//
//  LiveTitleView.swift
//  holo-wtf
//
// 
//

import SwiftUI

struct LiveTitleView: View {
    var body: some View {
        HStack {
            Label("LIVE_WIDGET_TITLE", systemImage: "person.wave.2.fill")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

struct LiveTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTitleView()
    }
}
