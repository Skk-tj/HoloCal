//
//  UIModes.swift
//  holo-wtf
//
//
//

import Foundation

enum PresentationMode {
    case normal
    case sorting
}

enum VideoType {
    case live
    case upcoming
    case past
}

enum UIMode {
    case compact
    case card
}

enum Tabs: String, Hashable {
    case live
    case upcoming
    case past
    case settings
}
