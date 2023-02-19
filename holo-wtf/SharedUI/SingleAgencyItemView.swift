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
        Label(title: {
            VStack(alignment: .leading) {
                Text(agency.getAgency().localizedName)
                Text(agency.getAgency().altLocalizedName)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
        }, icon: {
            Image(systemName: agency.getAgency().icon)
        })
    }
}

struct SingleAgencyItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleAgencyItemView(agency: .hololive)
    }
}
