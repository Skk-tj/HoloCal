//
//  LiveFavouritesView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveFavouritesView: View {
    @StateObject var live = LiveFavoritesViewModel()
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveFavouritesView) var isShowingCompact: Bool = false
    
    var body: some View {
        VideoUIListView(currentPresentationMode: Binding.constant(.normal), videoType: .live, uiMode: isShowingCompact ? .compact : .card, isFavourite: false)
            .environmentObject(live as VideoViewModel)
            .navigationTitle("ROOT_VIEW_FAVOURITES")
            .toolbar {
                ToolbarItemGroup(placement: .secondaryAction) {
                    LiveFavouritesViewToolbar()
                        .environmentObject(live as VideoViewModel)
                }
            }
            .task {
                await live.getVideoForUI()
                self.live.sortingStrategy = .notSorting
            }
            .refreshable {
                await live.getVideoForUI()
            }
            .animation(.easeInOut, value: live.dataStatus)
    }
}

struct LiveFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFavouritesView()
    }
}
