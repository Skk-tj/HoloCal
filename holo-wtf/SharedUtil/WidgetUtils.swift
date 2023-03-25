//
//  WidgetUtils.swift
//  holo-wtf
//
//
//

import Foundation

func widgetDeepLinkUrlParseView(url: URL) -> Tabs? {
    guard url.scheme == "holocal" else { return nil }
    guard url.host == "widget-launch" else { return nil }
    guard url.pathComponents.count == 3 else { return nil }
    
    let view = Tabs(rawValue: url.pathComponents[1])
    
    return view
}

func widgetDeepLinkUrlParseAgency(url: URL) -> ViewAgency? {
    guard url.scheme == "holocal" else { return nil }
    guard url.host == "widget-launch" else { return nil }
    guard url.pathComponents.count == 3 else { return nil }
    
    let agency = WidgetDeepLinkAgency(rawValue: url.pathComponents[2])
    guard let unwrappedAgency = agency else { return nil }
    
    return widgetDeepLinkToViewAgency[unwrappedAgency]
}
