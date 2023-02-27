//
//  NoStreamView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct NoStreamView: View {
    var body: some View {
        Spacer()
        Image(systemName: "questionmark.circle")
            .foregroundColor(.secondary)
            .font(.largeTitle)
        Text("NO_ONE_IS_STREAMING")
            .foregroundColor(.secondary)
        Spacer()
    }
}

struct NoStreamView_Previews: PreviewProvider {
    static var previews: some View {
        NoStreamView()
    }
}
