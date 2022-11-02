//
//  NijisanjiLiveVideo.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-10-30.
//

import Foundation

struct NijisanjiLiveVideo: LiveVideo {
    let id: String
    let title: String
    let topicId: String?
    let startScheduled: Date?
    let startActual: Date?
    let liveViewers: Int
    let mentions: [NijisanjiChannel]?
    
    var songs: [SongInStream]?
    var channel: NijisanjiChannel
    
    static let previewLive = NijisanjiLiveVideo(id: "abcd", title: "my debut live, but a really long title, aaaaaaa", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, mentions: [NijisanjiChannel.testChannel, NijisanjiChannel.testChannel2], songs: nil, channel: NijisanjiChannel.testChannel)
    
    static let previewLiveMemberOnly = NijisanjiLiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, mentions: [NijisanjiChannel.testChannel, NijisanjiChannel.testChannel2], songs: nil, channel: NijisanjiChannel.testChannel)
}
