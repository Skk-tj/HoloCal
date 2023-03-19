//
//  AgencyNavigationView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct AgencyNavigationView<DestinationContent: View, FavouritesContent: View>: View {
    let viewTitle: String?
    @ViewBuilder let targetView: (_ agency: AgencyEnum) -> DestinationContent
    @ViewBuilder let favouritesView: () -> FavouritesContent
    
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
        .navigationDestination(for: ViewAgency.self) { agency in
            if agency == .favourites {
                favouritesView()
            } else {
                targetView(viewAgencyToAgency[agency]!)
            }
        }
        .navigationTitle(LocalizedStringKey(viewTitle ?? "SETTINGS_SELECT_AGENCY_NAVIGATION_TITLE"))
    }
}
