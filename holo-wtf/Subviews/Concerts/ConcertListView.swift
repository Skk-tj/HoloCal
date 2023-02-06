//
//  ConcertListView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct ConcertListView<Content: View, DataStatusContent: View>: View {
    /// Defines the current sorting strategy
    @EnvironmentObject var viewModel: ConcertsViewModel
    
    /// The view of a single video.
    @ViewBuilder let singleConcertView: (_ concert: LiveConcert) -> Content
    
    /// The view of the counter at the bottom.
    @ViewBuilder let dataStatusView: () -> DataStatusContent
    
    var body: some View {
        List {
            ForEach(viewModel.concertList) { live in
                singleConcertView(live)
            }
            
            HStack {
                Spacer()
                dataStatusView()
                Spacer()
            }
        }
    }
}
