//
//  AgencySelectionView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-19.
//

import SwiftUI

struct AgencySelectionView<Content: View>: View {
    @ViewBuilder let targetView: (_ agency: AgencyEnum) -> Content
    
    var body: some View {
        List {
            ForEach(AgencyEnum.allCases, id: \.self) { agency in
                NavigationLink(destination: targetView(agency), label: {
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

//struct AgencySelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AgencySelectionView()
//    }
//}
