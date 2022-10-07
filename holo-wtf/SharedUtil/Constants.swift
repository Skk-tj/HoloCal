//
//  Constants.swift
//  holo-wtf
//
//
//

import Foundation

let widgetSampleChannel: Channel = .init(id: "UCp6993wxpyDPHUpavwDFqgg", name: "Tokino Sora", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLRo4fRoifdnGRyvGIOVxiumNdD5MXweEPHLO_SBrA=s800-c-k-c0x00ffffff-no-rj-mo"), org: "Hololive")

let widgetSampleVideo: LiveVideo = .init(id: "NT6Pf28eCgQ", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), liveViewers: 1000, mentions: nil, songs: nil, channel: widgetSampleChannel)

let hololiveLiveURL = "https://holodex.net/api/v2/live?org=Hololive&status=live&type=stream&include=songs,mentions"

let hololiveWidgetUpcomingURL = "https://holodex.net/api/v2/live?org=Hololive&status=upcoming&type=stream"

func liveSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.startActual ?? Date.distantFuture > l2.startActual ?? Date.distantFuture
}

func upcomingSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.startActual ?? Date.distantFuture < l2.startActual ?? Date.distantFuture
}
