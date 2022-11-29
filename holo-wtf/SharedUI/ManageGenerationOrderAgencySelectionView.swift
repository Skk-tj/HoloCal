//
//  ManageGenerationOrderAgencySelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageGenerationOrderAgencySelectionView: View {
    var body: some View {
        AgencySelectionView(targetView: { agency in
            ManageGenerationOrderView(agency: agency)
        })
    }
}

struct ManageGenerationOrderAgencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ManageGenerationOrderAgencySelectionView()
    }
}
