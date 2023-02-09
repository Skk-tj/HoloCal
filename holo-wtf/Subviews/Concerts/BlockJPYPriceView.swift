//
//  BlockJPYPriceView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct BlockJpyPriceView: View {
    let price: JpyPrice
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "ticket")
                Text(price.localized)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            Text("BLOCK_JPY_PRICE_TICKET_PRICE")
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}

struct BlockJpyPriceView_Previews: PreviewProvider {
    static var previews: some View {
        BlockJpyPriceView(price: .free)
        BlockJpyPriceView(price: .tbd)
        BlockJpyPriceView(price: .multiTier(7000))
        BlockJpyPriceView(price: .fixed(5000))
    }
}
