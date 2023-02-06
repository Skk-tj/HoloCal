//
//  ConcertCountView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ConcertCountView: View {
    @EnvironmentObject var concert: ConcertsViewModel
    
    var body: some View {
        Text("UPCOMING_CONCERTS_COUNT \(concert.concertList.count)")
            .foregroundColor(.secondary)
    }
}

struct ConcertCountView_Previews: PreviewProvider {
    static var previews: some View {
        ConcertCountView()
    }
}
