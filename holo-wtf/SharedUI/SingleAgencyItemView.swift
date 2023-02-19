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
            HStack(alignment: .bottom) {
                Text(agency.getAgency().localizedName)
                Text(agency.getAgency().altLocalizedName)
                    .foregroundColor(.secondary)
                    .font(.callout)
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
