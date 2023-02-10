//
//  ConcertWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct ConcertWatchView: View {
    let concert: LiveConcert
    
    var body: some View {
        ScrollView {
            VStack {
                if let imageURL = concert.imageUrl {
                    AsyncImage(url: imageURL, content: { image in
                        image
                            .resizable()
                            .aspectRatio(1.78, contentMode: .fit)
                    }, placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1.78, contentMode: .fit)
                            .background(Color.secondary)
                    })
                }
                else {
                    Image(systemName: "exclamationmark.circle")
                        .font(.system(size: 50))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1.78, contentMode: .fit)
                        .background(Color.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text(concert.title)
                        .font(.headline)
                    Text(concert.startTime.formatted(.dateTime.year().month().day().hour().minute().timeZone()))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        BlockJpyPriceView(price: concert.jpyPrice)
                            .padding(.bottom)
                        BlockFormatView(format: concert.format)
                            .padding(.bottom)
                        BlockPlatformView(platform: concert.platform)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("CONCERT_VIEW_TITLE")
    }
}

struct ConcertWatchView_Previews: PreviewProvider {
    static var previews: some View {
        ConcertWatchView(concert: LiveConcert.previewConcert)
    }
}
