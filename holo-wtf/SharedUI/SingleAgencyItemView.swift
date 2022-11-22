//
//  SingleAgencyItemView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-21.
//

import SwiftUI

struct SingleAgencyItemView: View {
    let agency: AgencyEnum
    
    var body: some View {
        HStack {
            Image(systemName: agencyEnumToAgency[agency]!.icon)
                .foregroundColor(.accentColor)
            
            VStack {
                Text(agencyEnumToAgency[agency]!.localizedName)
                Text(agencyEnumToAgency[agency]!.altLocalizedName)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct SingleAgencyItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleAgencyItemView(agency: .hololive)
    }
}
