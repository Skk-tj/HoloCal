//
//  UpcomingTitleView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingTitleView: View {
    var body: some View {
        HStack {
            Label("UPCOMING_WIDGET_TITLE", systemImage: "clock")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

struct UpcomingTitleView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingTitleView()
    }
}
