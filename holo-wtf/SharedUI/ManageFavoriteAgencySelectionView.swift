//
//  ManageFavoriteAgencySelectionView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-19.
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
