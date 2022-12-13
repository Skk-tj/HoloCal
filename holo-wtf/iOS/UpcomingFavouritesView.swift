//
//  UpcomingFavouritesView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingFavouritesView: View {
    @StateObject var upcoming: UpcomingFavoritesViewModel = UpcomingFavoritesViewModel(for: .hololive)
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingFavouritesView) var isShowingCompact: Bool = false
    
    var body: some View {
        VideoUIFavouriteListView(videoType: .upcoming, uiMode: isShowingCompact ? .compact : .card)
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
            }
            .refreshable {
                await upcoming.getVideoForUI()
            }
            .animation(.easeInOut, value: upcoming.dataStatus)
    }
}

struct UpcomingFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouritesView()
    }
}
