//
//  SettingsView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            SettingsFormView()
        }
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
