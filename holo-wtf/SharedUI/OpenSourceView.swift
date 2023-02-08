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
            Section {
                Link(destination: URL(string: "https://github.com/Skk-tj/HoloCal")!, label: {
                    Text("HoloCal is proudly open-source at GitHub")
                })
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("OPEN_SOURCE_VIEW_TITLE")
    }
}

struct OpenSourceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OpenSourceView()
        }
    }
}
