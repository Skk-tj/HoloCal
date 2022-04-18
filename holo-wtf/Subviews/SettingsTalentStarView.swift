//
//  SettingsTalentStarView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-05.
//

import SwiftUI

struct SettingsTalentStarView: View {
    let talent: Talent
    @Binding var favourited: [String]
    
    var body: some View {
        HStack {
            let isFavourited: Bool = favourited.contains(where: {$0 == talent.id})
            
            VStack(alignment: .leading) {
                if Locale.current.languageCode == "ja" {
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
        SettingsTalentStarView(talent: Talent(id: "abcd", names: ["en": "Tokino Sora", "ja": "ときのそら"]), favourited: Binding.constant(["abcd"]))
    }
}
