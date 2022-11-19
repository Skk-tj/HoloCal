//
//  ManageGenerationOrderAgencySelectionView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-14.
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
