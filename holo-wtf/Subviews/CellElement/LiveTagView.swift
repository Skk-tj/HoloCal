//
//  LiveTagView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveTagView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "person.wave.2.fill")
            Text("LIVE")
        }
        .padding(5)
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
        .font(.caption)
        .foregroundColor(.red)
    }
}

struct LiveTagView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTagView()
    }
}
