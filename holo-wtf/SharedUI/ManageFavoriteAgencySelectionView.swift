//
//  ManageFavoriteAgencySelectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ManageFavoriteAgencySelectionView: View {
    var body: some View {
        AgencySelectionView(targetView: { agency in
            ManageFavoriteView(agency: agency)
        })
    }
}

struct ManageFavoriteAgencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ManageFavoriteAgencySelectionView()
    }
}
