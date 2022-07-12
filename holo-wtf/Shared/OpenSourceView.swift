//
//  OpenSourceView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-22.
//

import SwiftUI

struct OpenSourceView: View {
    var body: some View {
        List {
            Link(destination: URL(string: "https://github.com/alexaubry/HTMLString")!) {
                Text("HTMLString")
            }
            
            Link(destination: URL(string: "https://github.com/SwiftUI-Plus/ActivityView")!) {
                Text("ActivityView")
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
