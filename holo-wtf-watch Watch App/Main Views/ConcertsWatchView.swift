//
//  ConcertsWatchView.swift
//  holo-wtf-watch Watch App
//
//
//

import SwiftUI

struct ConcertsWatchView: View {
    @StateObject var concert: ConcertsViewModel = ConcertsViewModel()
    
    var body: some View {
        ConcertListView(singleConcertView: { concert in
            NavigationLink(destination: {
                ConcertWatchView(concert: concert)
            }) {
                ConcertWatchCell(concert: concert)
            }
        }, dataStatusView: {
            DataStatusIndicatorView(dataStatus: concert.dataStatus) {
                ConcertCountView()
            }
        })
        .environmentObject(concert)
        .navigationTitle("ROOT_VIEW_CONCERTS")
        .task {
            await concert.getConcertsForUI()
        }
        .refreshable {
            await concert.getConcertsForUI()
        }
    }
}

struct ConcertsWatchView_Previews: PreviewProvider {
    static var previews: some View {
        ConcertsWatchView()
    }
}
