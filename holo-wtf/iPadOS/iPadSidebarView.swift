//
//  iPadSidebarView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-11.
//

import SwiftUI

struct iPadSidebarView: View {    
    var body: some View {
        List {
            NavigationLink(destination: LiveiPadView()) {
                Label("ROOT_VIEW_LIVE", systemImage: "person.wave.2.fill")
            }
            .tag(0)
            NavigationLink(destination: UpcomingiPadView()) {
                Label("ROOT_VIEW_UPCOMING", systemImage: "clock")
            }
            .tag(1)
            NavigationLink(destination: SettingsiPadView()) {
                Label("ROOT_VIEW_SETTINGS", systemImage: "gear")
            }
            .tag(2)
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
