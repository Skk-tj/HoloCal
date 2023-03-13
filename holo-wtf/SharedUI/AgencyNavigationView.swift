//
//  AgencyNavigationView.swift
//  holo-wtf
//
//
//

import SwiftUI
import OrderedCollections

let agencyToViewAgency: OrderedDictionary<AgencyEnum, ViewAgency> = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro
]

struct AgencyNavigationView<DestinationContent: View>: View {
    let viewTitle: String?
    @ViewBuilder let targetView: (_ agency: AgencyEnum) -> DestinationContent
    
    var body: some View {
        List {
            AgencyForEachView(singleAgency: { agency in
                NavigationLink(value: agencyToViewAgency[agency]!) {
                    SingleAgencyItemView(agency: agency)
                }
            })
            
            NavigationLink(value: ViewAgency.favourites) {
                Label("ROOT_VIEW_FAVOURITES", systemImage: "star.fill")
            }
        }
        .navigationTitle(LocalizedStringKey(viewTitle ?? "SETTINGS_SELECT_AGENCY_NAVIGATION_TITLE"))
        .navigationDestination(for: ViewAgency.self) { agency in
            targetView(viewAgencyToAgency[agency]!)
        }
    }
}
