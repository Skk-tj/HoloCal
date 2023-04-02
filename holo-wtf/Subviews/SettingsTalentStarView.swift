//
//  SettingsTalentStarView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SettingsTalentStarView: View {
    let talent: Talent
    @Binding var favourited: [String]
    
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
    }
}

struct SettingsTalentStarView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTalentStarView(talent: Talent(id: "abcd", names: [.en: "Tokino Sora", .ja: "ときのそら"], inGeneration: .hololive0thGen), favourited: Binding.constant(["abcd"]))
    }
}
