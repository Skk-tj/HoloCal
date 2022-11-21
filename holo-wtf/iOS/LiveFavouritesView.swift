//
//  LiveFavouritesView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveFavouritesView: View {
    @StateObject var live: LiveFavoritesViewModel = LiveFavoritesViewModel(for: .hololive)
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveFavouritesView) var isShowingCompact: Bool = false
    
    var body: some View {
        VideoUIFavouriteListView(videoType: .live, uiMode: isShowingCompact ? .compact : .card)
            .environmentObject(live as VideoViewModel)
            .navigationTitle("ROOT_VIEW_FAVOURITES")
            .task {
                await live.getLive()
            }
            .refreshable {
                await live.getLive()
            }
    }
}

struct LiveFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        LiveFavouritesView()
    }
}
