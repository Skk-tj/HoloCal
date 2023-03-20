//
//  Constants.swift
//  holo-wtf
//
//
//

import Foundation
import OrderedCollections

let agencyToViewAgency: OrderedDictionary<AgencyEnum, ViewAgency> = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro
]

let videoTypeToViewTitleAndIcon: [VideoType: (String, String)] = [
    .live: ("ROOT_VIEW_LIVE", "person.wave.2.fill"),
    .upcoming: ("ROOT_VIEW_UPCOMING", "clock"),
    .past: ("ROOT_VIEW_PAST", "clock.arrow.circlepath")
]

enum ViewAgency: CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case hololive
    case nijisanji
    case react
    case nanashiInc
    case noriPro
    case favourites
}

let viewAgencyToAgency: OrderedDictionary<ViewAgency, AgencyEnum> = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro
]

let widgetSampleChannel = Channel(id: "UCp6993wxpyDPHUpavwDFqgg", name: "Tokino Sora", photo: URL(string: "https://yt3.ggpht.com/ytc/AKedOLRo4fRoifdnGRyvGIOVxiumNdD5MXweEPHLO_SBrA=s800-c-k-c0x00ffffff-no-rj-mo"), org: "Hololive")

let widgetSampleVideo = LiveVideo(id: "NT6Pf28eCgQ", title: "My Debut Stream!", topicId: "debut", startScheduled: Date(), startActual: Date(), availableAt: Date(), publishedAt: Date(), liveViewers: 1000, mentions: nil, duration: 0, songs: nil, channel: widgetSampleChannel)

let allLiveURL = "https://holodex.net/api/v2/live?&status=live&type=stream"

let allUpcomingURL = "https://holodex.net/api/v2/live?status=upcoming&type=stream&max_upcoming_hours=%d"

let allWidgetUpcomingURL = "https://holodex.net/api/v2/live?status=upcoming&type=stream"

let allPastURL = "https://holodex.net/api/v2/videos?status=past&type=stream"

let concertAPIURL = "https://holo-wtf-api-trbge5wfpq-uc.a.run.app"

/// The video that started most recently goes first
func liveSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.startActual ?? (l1.startScheduled ?? Date.distantFuture) > l2.startActual ?? (l2.startScheduled ?? Date.distantFuture)
}

/// The video that starts the soonest goes first
func upcomingSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.startActual ?? (l1.startScheduled ?? Date.distantFuture) < l2.startActual ?? (l2.startScheduled ?? Date.distantFuture)
}

/// The video that ended most recently goes first
func pastSortStrategy(l1: LiveVideo, l2: LiveVideo) -> Bool {
    l1.endedAt > l2.endedAt
}

let widgetDeepLink = "holocal://widget-launch/%@/%@"

enum Tabs: String, Hashable {
    case live
    case upcoming
    case past
    case concerts
    case settings
}

/// Ugh, one-to-one copy of `IntentAgency`
enum WidgetDeepLinkAgency: String {
    case unknown
    case hololive
    case nijisanji
    case react
    case nanashiInc
    case noriPro
    case favourites
}

let intentAgencyToDeepLinkAgency: [IntentAgency: WidgetDeepLinkAgency] = [
    .unknown: .unknown,
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro,
    .favourites: .favourites
]

let widgetDeepLinkToViewAgency: [WidgetDeepLinkAgency: ViewAgency] = [
    .hololive: .hololive,
    .nijisanji: .nijisanji,
    .react: .react,
    .nanashiInc: .nanashiInc,
    .noriPro: .noriPro
]

let videoTypeToWidgetDeepLink: [VideoType: Tabs] = [
    .live: .live,
    .upcoming: .upcoming,
    .past: .past
]
