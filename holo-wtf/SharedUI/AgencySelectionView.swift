//
//  AgencySelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct AgencySelectionView<Content: View, ExtraContent: View>: View {
    let viewTitle: String?
    @ViewBuilder let targetView: (_ agency: AgencyEnum) -> Content
    @ViewBuilder let extraLinks: () -> ExtraContent
    
    init(viewTitle: String? = nil, targetView: @escaping (_ agency: AgencyEnum) -> Content, extraLinks: @escaping () -> ExtraContent) {
        self.viewTitle = viewTitle
        self.targetView = targetView
        self.extraLinks = extraLinks
    }
    
    init(viewTitle: String? = nil, targetView: @escaping (_ agency: AgencyEnum) -> Content) where ExtraContent == EmptyView {
        self.viewTitle = viewTitle
        self.targetView = targetView
        self.extraLinks = { EmptyView() }
    }
    
    var body: some View {
        List {
            AgencyForEachView(singleAgency: { agency in
                NavigationLink(destination: targetView(agency), label: {
                    SingleAgencyItemView(agency: agency)
                })
            })
            
            extraLinks()
        }
        .navigationTitle(LocalizedStringKey(viewTitle ?? "SETTINGS_SELECT_AGENCY_NAVIGATION_TITLE"))
    }
}

//struct AgencySelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AgencySelectionView()
//    }
//}
