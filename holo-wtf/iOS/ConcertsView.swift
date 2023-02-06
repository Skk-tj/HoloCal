//
//  ConcertsView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ConcertsView: View {
    @StateObject var concert: ConcertsViewModel = ConcertsViewModel()
    
    var body: some View {
        ConcertListView(singleConcertView: { concert in
            Text(concert.title)
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

struct ConcertsView_Previews: PreviewProvider {
    static var previews: some View {
        ConcertsView()
    }
}
