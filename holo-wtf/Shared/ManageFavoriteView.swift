//
//  ManageFavoriteView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageFavoriteView: View {
    @State var showResetAlert: Bool = false
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        let lang: NameLanguage = Locale.current.languageCode == "ja" ? .ja : .en
        
        List {
            ForEach(talentsByGeneration, id: \.self) { generation in
                Section(generationToName[generation.generation]![lang]!) {
                    ForEach(generation.members) { talent in
                        SettingsTalentStarView(talent: talentsToName[talent]!, favourited: $favourited)
                    }
                }
            }
            Section {
                Button(role: .destructive, action: {
                    showResetAlert = true
                }, label: {
                    Text("SETTINGS_MANAGE_FAVOURITE_RESET")
                })
                .confirmationDialog("SETTINGS_MANAGE_FAVOURITE_RESET_ALERT_TEXT", isPresented: $showResetAlert, actions: {
                    Button("SETTINGS_MANAGE_FAVOURITE_RESET_ALERT_RESET", role: .destructive) {
                        favourited.removeAll()
                    }
                }, message: {
                   Text("SETTINGS_MANAGE_FAVOURITE_RESET_ALERT_TEXT")
                })
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
