//
//  SearchForEachView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SearchForEachView<Content: View>: View {
    @EnvironmentObject var viewModel: VideoViewModel
    let searchText: String
    
    @ViewBuilder let cellView: (_ live: LiveVideo) -> Content
    
    @ViewBuilder
    var body: some View {
        ForEach(viewModel.videoList.filter { video in
            video.channel.talent.names[.en]!.localizedCaseInsensitiveContains(searchText) || video.channel.talent.names[.ja]!.localizedCaseInsensitiveContains(searchText) || (video.topicId ?? "").localizedStandardContains(searchText)
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
