//
//  UpcomingFavouritesView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-11-20.
//

import SwiftUI

struct UpcomingFavouritesView: View {
    @StateObject var upcoming: UpcomingFavoritesViewModel = UpcomingFavoritesViewModel(for: .hololive)
    
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingFavouritesView) var isShowingCompact: Bool = false
    
    var body: some View {
        VideoUIFavouriteListView(videoType: .upcoming, uiMode: isShowingCompact ? .compact : .card)
            .environmentObject(upcoming as VideoViewModel)
            .navigationTitle("ROOT_VIEW_FAVOURITES")
            .task {
                await upcoming.getUpcoming()
            }
            .refreshable {
                await upcoming.getUpcoming()
            }
    }
}

struct UpcomingFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingFavouritesView()
    }
}
