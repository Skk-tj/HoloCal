//
//  ManageFavoriteView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-03.
//

import SwiftUI

struct ManageFavoriteView: View {
    let agency: AgencyEnum
    
    @State var showResetAlert: Bool = false
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    var body: some View {
        List {
            ForEach(agencyEnumToGenerations[agency]!, id: \.self) { generation in
                Section(talentsByGeneration[generation]!.localizedName) {
                    ForEach(talentsByGeneration[generation]!.members) { talent in
                        SettingsTalentStarView(talent: talentEnumToTalent[talent]!, favourited: $favourited)
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
                        favourited.removeAll(where: {
                            if let talent = TalentEnum(rawValue: $0) {
                                let inGeneration = talentEnumToTalent[talent]!.inGeneration
                                return agencyEnumToGenerations[agency]!.contains(where: {$0 == inGeneration})
                            } else {
                                return true
                            }
                        })
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
        ManageFavoriteView(agency: .hololive)
        ManageFavoriteView(agency: .nijisanji)
    }
}
