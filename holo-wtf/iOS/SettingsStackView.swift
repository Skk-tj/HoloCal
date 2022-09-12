//
//  SettingsStackView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-09-12.
//

import SwiftUI

@available(iOS 16.0, *)
struct SettingsStackView: View {
    var body: some View {
        NavigationStack {
            SettingsFormView()
        }
    }
}

@available(iOS 16.0, *)
struct SettingsStackView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsStackView()
    }
}
