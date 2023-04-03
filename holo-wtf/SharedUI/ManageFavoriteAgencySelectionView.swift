//
//  ManageFavoriteAgencySelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageFavoriteAgencySelectionView: View {
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    var body: some View {
        AgencySelectionView(viewTitle: "SETTINGS_MANAGE_FAVOURITE_VIEW_TITLE", targetView: { agency in
            ManageFavoriteView(agency: agency)
        }, topContent: {
            if !favourited.isEmpty {
                Section("SETTINGS_MANAGE_FAVOURITE_FAVOURITE_SECTION") {
                    ForEach(favourited, id: \.self) { talent in
                        if let talentEnum = TalentEnum(rawValue: talent) {
                            SettingsTalentStarView(talent: talentEnumToTalent[talentEnum]!)
                        }
                    }
                }
            } else {
                EmptyView()
            }
        })
        .animation(.easeInOut, value: favourited)
        .onReceive(NotificationCenter.default.publisher(for: NSUbiquitousKeyValueStore.didChangeExternallyNotification), perform: { @MainActor _ in
            if let favourited = NSUbiquitousKeyValueStore.default.array(forKey: UserDefaultKeys.favouritedChannel) {
                self.favourited = favourited as? [String] ?? []
            }
        })
    }
}

struct ManageFavoriteAgencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ManageFavoriteAgencySelectionView()
    }
}
