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
        Text("Test concerts")
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
