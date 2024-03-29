//
//  ManageFavoriteView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageFavoriteView: View {
    let agency: AgencyEnum
    
    @State var showResetAlert: Bool = false
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    @State var searchText: String = ""
    
    var body: some View {
        List {
            if searchText.isEmpty {
                ForEach(agencyEnumToGenerations[agency]!, id: \.self) { generation in
                    Section(talentsByGeneration[generation]!.localizedName) {
                        ForEach(talentsByGeneration[generation]!.members) { talent in
                            SettingsTalentStarView(talent: talentEnumToTalent[talent]!)
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
                            NSUbiquitousKeyValueStore.default.set(favourited, forKey: UserDefaultKeys.favouritedChannel)
                        }
                    }, message: {
                        Text("SETTINGS_MANAGE_FAVOURITE_RESET_ALERT_TEXT")
                    })
                }
                
            } else {
                ForEach(getSearchResult(searchText)) { result in
                    SettingsTalentStarView(talent: result)
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle(agency.getAgency().localizedName)
    }
    
    func getSearchResult(_ searchText: String) -> [Talent] {
        let generationsForThisAgency: [Generation] = agencyEnumToGenerations[agency]!
        
        // Filter talents who belong to this agency
        let talentsInThisAgency = talentEnumToTalent.values.filter({ talent in
            generationsForThisAgency.contains(where: { $0 == talent.inGeneration })
        })
        
        let talentsFitInThisSearch = talentsInThisAgency.filter({ talent in
            talent.names[.en]!.localizedCaseInsensitiveContains(searchText) || talent.names[.ja]!.localizedCaseInsensitiveContains(searchText)
        })
        
        return talentsFitInThisSearch
    }
}

struct ManageFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ManageFavoriteView(agency: .hololive)
        ManageFavoriteView(agency: .nijisanji)
    }
}
