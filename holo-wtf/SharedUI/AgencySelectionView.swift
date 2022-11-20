//
//  AgencySelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct AgencySelectionView<Content: View>: View {
    let viewTitle: String?
    @ViewBuilder let targetView: (_ agency: AgencyEnum) -> Content
    
    init(targetView: @escaping (_ agency: AgencyEnum) -> Content) {
        self.viewTitle = nil
        self.targetView = targetView
    }
    
    init(viewTitle: String, targetView: @escaping (_ agency: AgencyEnum) -> Content) {
        self.viewTitle = viewTitle
        self.targetView = targetView
    }
    
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
        .navigationTitle(LocalizedStringKey(viewTitle ?? "SETTINGS_SELECT_AGENCY_NAVIGATION_TITLE"))
    }
}

//struct AgencySelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AgencySelectionView()
//    }
//}
