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
                    Text(concert.startTime.formatted(.dateTime.year().month().day().hour().minute().timeZone()))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    ViewThatFits {
                        HStack {
                            BlockJpyPriceView(price: concert.jpyPrice)
                                .padding(.trailing)
                            BlockFormatView(format: concert.format)
                                .padding(.trailing)
                            BlockPlatformView(platform: concert.platform)
                        }
                        .padding(.bottom, 1)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                BlockJpyPriceView(price: concert.jpyPrice)
                                    .padding(.trailing)
                                BlockFormatView(format: concert.format)
                            }
                            .padding(.bottom, 1)
                            BlockPlatformView(platform: concert.platform)
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        if let twitterLink = concert.twitterUrl {
                            Link(destination: twitterLink) {
                                Text("\(Image(systemName: "link")) \(NSLocalizedString("CONCERT_VIEW_TWITTER_LINK", comment: ""))")
                            }
                            .padding(.bottom, 1)
                        }
                        
                        if let youtubeLink = concert.youtubeLink {
                            Link(destination: youtubeLink) {
                                Text("\(Image(systemName: "link")) \(NSLocalizedString("CONCERT_VIEW_YOUTUBE_LINK", comment: ""))")
                            }
                            .padding(.bottom, 1)
                        }
                        
                        if let ticketLink = concert.ticketLink {
                            Link(destination: ticketLink) {
                                Text("\(Image(systemName: "link")) \(NSLocalizedString("CONCERT_VIEW_PURCHASE_TICKETS", comment: ""))")
                            }
                            .padding(.bottom, 1)
                        }
                        
                        if let officialLink = concert.officialLink {
                            Link(destination: officialLink) {
                                Text("\(Image(systemName: "link")) \(NSLocalizedString("CONCERT_VIEW_OFFICIAL_LINK", comment: ""))")
                            }
                            .padding(.bottom, 1)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("CONCERT_VIEW_TITLE")
    }
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
