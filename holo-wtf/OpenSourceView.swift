//
//  OpenSourceView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct OpenSourceView: View {
    var body: some View {
        List {
            Link(destination: URL(string: "https://github.com/joekndy/MarqueeText")!) {
                Text("MarqueeText")
            }
            
            Link(destination: URL(string: "https://github.com/alexaubry/HTMLString")!) {
                Text("HTMLString")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("OPEN_SOURCE_VIEW_TITLE")
    }
}

struct OpenSourceView_Previews: PreviewProvider {
    static var previews: some View {
        OpenSourceView()
    }
}
