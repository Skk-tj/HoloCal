//
//  UpcomingFavouritesView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingFavouritesView: View {
    @StateObject var upcoming = UpcomingFavoritesViewModel()
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingFavouritesView) var isShowingCompact: Bool = false
    
    var body: some View {
        VideoUIListView(currentPresentationMode: Binding.constant(.normal), videoType: .upcoming, uiMode: isShowingCompact ? .compact : .card, isFavourite: false)
            .environmentObject(upcoming as VideoViewModel)
            .navigationTitle("ROOT_VIEW_FAVOURITES")
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    UpcomingFavouritesViewToolbar()
                        .environmentObject(upcoming as VideoViewModel)
                }
            }
            .task {
                await upcoming.getVideoForUI()
                self.upcoming.sortingStrategy = .notSorting
            }
            .refreshable {
                await upcoming.getVideoForUI()
                self.upcoming.sortingStrategy = .notSorting
            }
            .animation(.easeInOut, value: upcoming.dataStatus)
    }
}

struct UpcomingFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouritesView()
    }
}
