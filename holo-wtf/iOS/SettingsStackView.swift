//
//  SettingsStackView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SettingsStackView: View {
    var body: some View {
        NavigationStack {
            SettingsFormView()
        }
    }
}

struct SettingsStackView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsStackView()
    }
}
