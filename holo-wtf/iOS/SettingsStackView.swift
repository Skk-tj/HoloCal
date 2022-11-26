//
//  SettingsStackView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-12.
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
