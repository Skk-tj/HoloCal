//
//  AgencyForEachView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-20.
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
                SingleAgencyItemView(agency: agency)
            })
        }
    }
}
