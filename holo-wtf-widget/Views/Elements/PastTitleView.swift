//
//  PastTitleView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastTitleView: View {
    var body: some View {
        HStack {
            Label("PAST_WIDGET_TITLE", systemImage: "clock.arrow.circlepath")
                .font(.caption2)
                .foregroundColor(.secondary)
            
            Spacer()
        }
    }
}

struct PastTitleView_Previews: PreviewProvider {
    static var previews: some View {
        PastTitleView()
    }
}
