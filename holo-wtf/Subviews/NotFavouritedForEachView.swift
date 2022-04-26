//
//  NotFavouritedForEachView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-25.
//

import SwiftUI

struct NotFavouritedForEachView<Content: View>: View {
    @AppStorage("favouritedChannel") var favourited = Favourited()
    
    let viewModel: VideoViewModel
    @ViewBuilder let cellView: (_ video: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        ForEach(viewModel.videoList.filter { video in
            !favourited.contains(where: { video.channel.id == $0 })
        }, id: \.self) { live in
            cellView(live)
        }
    }
}

//struct NotFavouritedForEachView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotFavouritedForEachView()
//    }
//}
