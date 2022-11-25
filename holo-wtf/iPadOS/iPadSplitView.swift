//
//  iPadSplitView.swift
//  holo-wtf
//
//
//

import SwiftUI

@available(iOS 16.0, *)
struct iPadSplitView: View {
    @State var viewSelection: Views? = Views.live
    
    
    var body: some View {
        NavigationSplitView(sidebar: {
            List(selection: $viewSelection) {
                NavigationLink(value: Views.live) {
                    Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
                }
                NavigationLink(value: Views.upcoming) {
                    Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
                }
                NavigationLink(value: Views.settings) {
                    Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("HoloCal")
        }, detail: {
            NavigationStack {
                if let viewSelection {
                    switch viewSelection {
                    case Views.live:
                        LiveiPadView()
                    case Views.upcoming:
                        UpcomingiPadView()
                    case Views.settings:
                        SettingsiPadView()
                    }
                }
            }
        })
    }
}

@available(iOS 16.0, *)
struct iPadSplitView_Previews: PreviewProvider {
    static var previews: some View {
        iPadSplitView()
    }
}
