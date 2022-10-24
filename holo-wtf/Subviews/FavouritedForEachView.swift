//
//  FavouritedForEachView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct FavouritedForEachView<Content: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    @EnvironmentObject var viewModel: HololiveVideoViewModel
    @ViewBuilder let cellView: (_ video: any LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        ForEach(viewModel.videoList.filter { video in
            favourited.contains(where: { video.channel.id == $0 })
        }) { live in
            cellView(live)
        }
    }
}

//struct FavouritedForEachView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritedForEachView()
//    }
//}
