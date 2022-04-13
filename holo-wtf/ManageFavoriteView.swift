//
//  ManageFavoriteView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-03.
//

import SwiftUI

struct ManageFavoriteView: View {
    @State var showResetAlert: Bool = false
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        List {
            ForEach(talentsByGeneration, id: \.self) { generation in
                Section(Locale.preferredLanguages[0] == "ja" ? generation.generation["ja"]! : generation.generation["en"]!) {
                    ForEach(generation.talents) { talent in
                        SettingsTalentStarView(talent: talent, favourited: $favourited)
                    }
                }
            }
            Section {
                Button(role: .destructive, action: {
                    showResetAlert = true
                }, label: {
                    Text("SETTINGS_MANAGE_FAVOURITE_RESET")
                })
                .alert("SETTINGS_MANAGE_FAVOURITE_RESET_ALERT_TEXT", isPresented: $showResetAlert) {
                    Button("SETTINGS_MANAGE_FAVOURITE_RESET_ALERT_CANCEL", role: .cancel) {}
                    Button("SETTINGS_MANAGE_FAVOURITE_RESET_ALERT_RESET", role: .destructive) {
                        favourited.removeAll()
                    }
                }
            }
        }
        .navigationTitle("SETTINGS_MANAGE_FAVOURITE_VIEW_TITLE")
    }
}

struct ManageFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ManageFavoriteView()
    }
}
