//
//  ManageGenerationOrderAgencySelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageGenerationOrderAgencySelectionView: View {
    var body: some View {
        List {
            ForEach(AgencyEnum.allCases, id: \.self) { agency in
                NavigationLink(destination: ManageGenerationOrderView(agency: agency), label: {
                    VStack {
                        Text(agencyEnumToAgency[agency]!.localizedName)
                        Text(agencyEnumToAgency[agency]!.altLocalizedName)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                })
            }
        }
        .navigationTitle("SETTINGS_SELECT_AGENCY_NAVIGATION_TITLE")
    }
}

struct ManageGenerationOrderAgencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationOrderAgencySelectionView()
    }
}
