//
//  ConcertCell.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ConcertCell: View {
    let concert: LiveConcert
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(concert.title)
                .font(.title2)
            Text(getConcertFormatter().string(from: concert.startTime))
                .foregroundColor(.secondary)
        }
    }
}

struct ConcertCell_Previews: PreviewProvider {
    static var previews: some View {
        ConcertCell(concert: LiveConcert.previewConcert)
    }
}
