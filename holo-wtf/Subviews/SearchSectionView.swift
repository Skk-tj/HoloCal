//
//  SearchSectionView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SearchSectionView<Content: View>: View {
    @EnvironmentObject var viewModel: VideoViewModel
    let searchText: String
    
    @ViewBuilder let cellView: (_ live: LiveVideo) -> Content
    
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
