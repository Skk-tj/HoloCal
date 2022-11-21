//
//  AgencyForEachView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct AgencyForEachView<Content: View>: View {
    @ViewBuilder let singleAgency: (_ agency: AgencyEnum) -> Content
    
    @ViewBuilder
    var body: some View {
        ForEach(AgencyEnum.allCases, id: \.self) { agency in
            singleAgency(agency)
        }
    }
}

struct AgencyForEachView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AgencyForEachView(singleAgency: { agency in
                VStack {
                    Text(agencyEnumToAgency[agency]!.localizedName)
                    Text(agencyEnumToAgency[agency]!.altLocalizedName)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            })
        }
    }
}
