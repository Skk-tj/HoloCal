//
//  FavouritedForEachView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-25.
//

import SwiftUI

struct FavouritedForEachView<Content: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    let viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
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
