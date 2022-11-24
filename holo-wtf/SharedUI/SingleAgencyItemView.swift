//
//  SingleAgencyItemView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SingleAgencyItemView: View {
    let agency: AgencyEnum
    
    var body: some View {
        HStack {
            Image(systemName: agencyEnumToAgency[agency]!.icon)
                .foregroundColor(.accentColor)
            
            VStack(alignment: .leading) {
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
