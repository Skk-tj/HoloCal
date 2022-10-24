//
//  SearchSectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SearchSectionView<Content: View>: View {
    @EnvironmentObject var viewModel: HololiveVideoViewModel
    let searchText: String
    
    @ViewBuilder let cellView: (_ live: any LiveVideo) -> Content
    
    var body: some View {
        Section {
            ForEach(viewModel.videoList.filter { video in
                video.channel.getTalentName().localizedCaseInsensitiveContains(searchText) ||
                video.channel.getAltTalentName().localizedCaseInsensitiveContains(searchText) ||
                (video.topicId ?? "").localizedStandardContains(searchText)
            }) { live in
                cellView(live)
            }
        }
    }
}

//struct SearchSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchSectionView()
//    }
//}
