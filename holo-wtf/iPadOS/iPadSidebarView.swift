//
//  iPadSidebarView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct iPadSidebarView: View {
    var body: some View {
        List {
            NavigationLink(destination: LiveiPadView()) {
                Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
            }
            NavigationLink(destination: UpcomingiPadView()) {
                Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
            }
            NavigationLink(destination: SettingsiPadView()) {
                Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("HoloCal")
    }
}

struct iPadSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        iPadSidebarView()
    }
}
