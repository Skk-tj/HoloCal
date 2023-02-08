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
                switch price {
                case .free:
                    Text("Free")
                        .font(.title3)
                        .fontWeight(.bold)
                case .tbd:
                    Text("TBD")
                        .font(.title3)
                        .fontWeight(.bold)
                case .multiTier(let price):
                    Text("\(price.formatted(.currency(code: "JPY")))+")
                        .font(.title3)
                        .fontWeight(.bold)
                case .fixed(let price):
                    Text("\(price.formatted(.currency(code: "JPY")))")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            Text("Ticket Price")
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
