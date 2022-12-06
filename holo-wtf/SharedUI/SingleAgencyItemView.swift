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
        Label(agency.getAgency().localizedName, systemImage: agency.getAgency().icon)
//        Label(title: {
//            VStack(alignment: .leading, content: {
//                Text(agencyEnumToAgency[agency]!.localizedName)
//                Text(agencyEnumToAgency[agency]!.altLocalizedName)
//                    .foregroundColor(.secondary)
//                    .font(.caption)
//            })
//        }, icon: {
//            Image(systemName: agencyEnumToAgency[agency]!.icon)
//        })
    }
}

struct SingleAgencyItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleAgencyItemView(agency: .hololive)
    }
}
