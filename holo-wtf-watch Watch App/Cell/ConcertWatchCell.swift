//
//  ConcertWatchCell.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct ConcertWatchCell: View {
    let concert: LiveConcert
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(concert.title)
                .font(.headline)
            Text(concert.startTime.formatted(.dateTime.year().month().day().hour().minute().timeZone()))
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct ConcertWatchCell_Previews: PreviewProvider {
    static var previews: some View {
        ConcertWatchCell(concert: LiveConcert.previewConcert)
    }
}
