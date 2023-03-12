//
//  AgencySelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct AgencySelectionView<Content: View, ExtraContent: View, TopContent: View>: View {
    let viewTitle: String?
    @ViewBuilder let targetView: (_ agency: AgencyEnum) -> Content
    @ViewBuilder let extraLinks: () -> ExtraContent
    @ViewBuilder let topContent: () -> TopContent
    
    init(viewTitle: String? = nil, targetView: @escaping (_ agency: AgencyEnum) -> Content, extraLinks: @escaping () -> ExtraContent) where TopContent == EmptyView {
        self.viewTitle = viewTitle
        self.targetView = targetView
        self.extraLinks = extraLinks
        self.topContent = { EmptyView() }
    }
    
    init(viewTitle: String? = nil, targetView: @escaping (_ agency: AgencyEnum) -> Content, topContent: @escaping () -> TopContent) where ExtraContent == EmptyView {
        self.viewTitle = viewTitle
        self.targetView = targetView
        self.topContent = topContent
        self.extraLinks = { EmptyView() }
    }
    
    init(viewTitle: String? = nil, targetView: @escaping (_ agency: AgencyEnum) -> Content) where ExtraContent == EmptyView, TopContent == EmptyView {
        self.viewTitle = viewTitle
        self.targetView = targetView
        self.extraLinks = { EmptyView() }
        self.topContent = { EmptyView() }
    }
    
    var body: some View {
        List {
            topContent()
            
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
