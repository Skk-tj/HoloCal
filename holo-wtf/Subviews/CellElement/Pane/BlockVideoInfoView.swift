//
//  BlockViewInfoView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockVideoInfoView<PrimaryContent: View, SecondaryContent: View>: View {
    let iconName: String
    @ViewBuilder let primaryText: () -> PrimaryContent
    @ViewBuilder let secondaryText: () -> SecondaryContent
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: iconName)
                primaryText()
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            secondaryText()
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}
