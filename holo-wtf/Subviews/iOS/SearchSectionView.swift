//
//  SearchSectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SearchSectionView<Content: View>: View {
    let viewModel: VideoViewModel
    let searchText: String
    
    @ViewBuilder let cellView: (_ live: LiveVideo) -> Content
    
    var body: some View {
        Section {
            SearchForEachView(viewModel: viewModel, searchText: searchText, cellView: { live in
                cellView(live)
            })
        }
    }
}

//struct SearchSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchSectionView()
//    }
//}
