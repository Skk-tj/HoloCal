//
//  SettingsView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-21.
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
