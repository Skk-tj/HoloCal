//
//  SettingsTalentStarView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SettingsTalentStarView: View {
    let talent: Talent
    @AppStorage(UserDefaultKeys.favouritedChannel, store: UserDefaults(suiteName: "group.io.skk-tj.holo-wtf.ios")) var favourited = Favourited()
    
    var body: some View {
        let isFavourited: Bool = favourited.contains(where: {$0 == talent.id})
        
        HStack {
            MultiLanguageNameView(entity: talent)
            Spacer()
            Button(action: {
                if !isFavourited {
                    favourited.append(talent.id)
                } else {
                    favourited.removeAll(where: {$0 == talent.id})
                }
            }, label: {
                Label("Favorite", systemImage: isFavourited ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
            })
        }
        .onChange(of: favourited, perform: { favourited in
            NSUbiquitousKeyValueStore.default.set(favourited, forKey: UserDefaultKeys.favouritedChannel)
        })
        .onReceive(NotificationCenter.default.publisher(for: NSUbiquitousKeyValueStore.didChangeExternallyNotification), perform: { @MainActor _ in
            if let favourited = NSUbiquitousKeyValueStore.default.array(forKey: UserDefaultKeys.favouritedChannel) {
                self.favourited = favourited as? [String] ?? []
            }
        })
    }
}

struct SettingsTalentStarView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTalentStarView(talent: Talent(id: "abcd", names: [.en: "Tokino Sora", .ja: "ときのそら"], inGeneration: .hololive0thGen))
    }
}
