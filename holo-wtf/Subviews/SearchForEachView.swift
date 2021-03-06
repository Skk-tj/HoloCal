//
//  SearchForEachView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-25.
//

import SwiftUI

struct SearchForEachView<Content: View>: View {
    @EnvironmentObject var viewModel: VideoViewModel
    let searchText: String
    
    @ViewBuilder let cellView: (_ live: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        ForEach(viewModel.videoList.filter { video in
            video.channel.getTalentName(lang: .en).localizedCaseInsensitiveContains(searchText) ||
            video.channel.getTalentName(lang: .ja).localizedCaseInsensitiveContains(searchText) ||
            (video.topicId ?? "").localizedStandardContains(searchText)
        }) { live in
            cellView(live)
        }
    }
}

//struct SearchForEachView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchForEachView()
//    }
//}
