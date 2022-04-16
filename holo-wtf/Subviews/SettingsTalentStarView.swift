//
//  SettingsTalentStarView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SettingsTalentStarView: View {
    let talent: Talent
    @Binding var favourited: [Int]
    
    var body: some View {
        HStack {
            let isFavourited: Bool = favourited.contains(where: {$0 == talent.id})
            
            VStack(alignment: .leading) {
                if Locale.preferredLanguages[0] == "ja" {
                    Text("\(talent.names["ja"]!)")
                        .font(.body)
                    Text("\(talent.names["en"]!)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                } else {
                    Text("\(talent.names["en"]!)")
                        .font(.body)
                    Text("\(talent.names["ja"]!)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
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
        SettingsTalentStarView(talent: Talent(id: 41, names: ["en": "Tokino Sora", "ja": "ときのそら"]), favourited: Binding.constant([0]))
    }
}