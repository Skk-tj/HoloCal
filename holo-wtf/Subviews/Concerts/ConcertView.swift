//
//  ConcertView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ConcertView: View {
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
                        .font(.title)
                    Text(getConcertFormatter().string(from: concert.startTime))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    HStack {
                        BlockJpyPriceView(price: concert.jpyPrice)
                        BlockFormatView(format: concert.format)
                    }
                    .padding(.bottom, 1)
                    BlockPlatformView(platform: concert.platform)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        if let twitterLink = concert.twitterUrl {
                            Link(destination: twitterLink) {
                                Text("\(Image(systemName: "link")) Twitter Link")
                            }
                            .padding(.bottom, 1)
                        }
                        
                        if let youtubeLink = concert.youtubeLink {
                            Link(destination: youtubeLink) {
                                Text("\(Image(systemName: "link")) YouTube Link")
                            }
                            .padding(.bottom, 1)
                        }
                        
                        if let ticketLink = concert.ticketLink {
                            Link(destination: ticketLink) {
                                Text("\(Image(systemName: "link")) Purchase Tickets")
                            }
                            .padding(.bottom, 1)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Concert")
    }
}

func getCurrencyFormatter() -> NumberFormatter {
    let formatter = NumberFormatter()
    formatter.locale = .init(identifier: "ja_JP")
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 0
    
    return formatter
}

struct ConcertView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ConcertView(concert: LiveConcert.previewConcert)
        }
        
        NavigationStack {
            ConcertView(concert: LiveConcert.previewConcertNoImage)
        }
    }
}
