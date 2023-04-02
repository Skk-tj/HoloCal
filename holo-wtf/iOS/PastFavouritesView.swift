//
//  PastFavouritesView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct PastFavouritesView: View {
    @StateObject var past = PastFavoritesViewModel()
    
    @AppStorage(UserDefaultKeys.isShowingCompactInPastFavouritesView) var isShowingCompact: Bool = false
    
    var body: some View {
        VideoUIFavouriteListView(videoType: .past, uiMode: isShowingCompact ? .compact : .card)
            .environmentObject(past as VideoViewModel)
            .navigationTitle("ROOT_VIEW_FAVOURITES")
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    PastFavouritesViewToolbar()
                        .environmentObject(past as VideoViewModel)
                }
            }
            .task {
                await past.getVideoForUI()
                self.past.sortingStrategy = .notSorting
            }
            .refreshable {
                await past.getVideoForUI()
                self.past.sortingStrategy = .notSorting
            }
            .animation(.easeInOut, value: past.dataStatus)
    }
}

struct PastFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        PastFavouritesView()
    }
}
