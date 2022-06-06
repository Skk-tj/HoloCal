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
        let lang: NameLanguage = Locale.current.languageCode == "ja" ? .ja : .en
        let altLang: NameLanguage = Locale.current.languageCode == "ja" ? .en : .ja
        
        HStack {
            let isFavourited: Bool = favourited.contains(where: {$0 == talent.id})
            
            VStack(alignment: .leading) {
                Text("\(talent.names[lang]!)")
                    .font(.body)
                Text("\(talent.names[altLang]!)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: {
                if !isFavourited {
                    favourited.append(talent.id)
                } else {
                    favourited.removeAll(where: {$0 == talent.id})
                }
            }) {
                Label("Favorite", systemImage: isFavourited ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
            }
        }
    }
}

struct SettingsTalentStarView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTalentStarView(talent: Talent(id: "abcd", names: [.en: "Tokino Sora", .ja: "ときのそら"], inGeneration: .zerothGen), favourited: Binding.constant(["abcd"]))
    }
}
