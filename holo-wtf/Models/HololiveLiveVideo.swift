//
//  VideoNew.swift
//  holo-wtf
//
//
//

import Foundation

struct HololiveLiveVideo: LiveVideo {
    let id: String
    let title: String
    let topicId: String?
    let startScheduled: Date?
    let startActual: Date?
    let liveViewers: Int
    let mentions: [HololiveChannel]?
    
    var songs: [SongInStream]?
    var channel: HololiveChannel
    
    static let previewLive = HololiveLiveVideo(id: "abcd", title: "my debut live, but a really long title, aaaaaaa", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, mentions: [HololiveChannel.testChannel, HololiveChannel.testChannel2], songs: nil, channel: HololiveChannel.testChannel)
    
    static let previewLiveMemberOnly = HololiveLiveVideo(id: "abcd", title: "my debut live member only", topicId: "game", startScheduled: Date(), startActual: Date() + 4000, liveViewers: 12345, mentions: [HololiveChannel.testChannel, HololiveChannel.testChannel2], songs: nil, channel: HololiveChannel.testChannel)
}
