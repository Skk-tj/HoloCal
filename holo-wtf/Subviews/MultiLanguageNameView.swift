//
//  MultiLanguageNameView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct MultiLanguageNameView: View {
    let entity: any Vtuberable
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(entity.localizedName)
                .font(.body)
            Text(entity.altLocalizedName)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct MultiLanguageNameView_Previews: PreviewProvider {
    static var previews: some View {
        MultiLanguageNameView(entity: Talent(id: TalentEnum.nijisanji.rawValue, names: [.en: "Nijisanji", .ja: "にじさんじ"], inGeneration: Generation.nijisanjiOfficial))
    }
}
