//
//  LiveViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    
    @AppStorage(UserDefaultKeys.isShowingCompactInLiveView) var isShowingCompactInLiveView: Bool = true
    
    var body: some View {
        Menu {
            Button {
                isShowingAbsoluteTime.toggle()
                UserDefaults.standard.set(isShowingAbsoluteTime, forKey: UserDefaultKeys.isShowingAbsoluteTimeInLiveView)
            } label: {
                Label(isShowingAbsoluteTime ? "LIVE_VIEW_TOOLBAR_SHOW_RELATIVE" : "LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
            }
            
            Button {
                isShowingCompactInLiveView.toggle()
                UserDefaults.standard.set(isShowingCompactInLiveView, forKey: UserDefaultKeys.isShowingCompactInLiveView)
            } label: {
                Label(isShowingCompactInLiveView ? "LIVE_VIEW_TOOLBAR_SHOW_CARD" : "LIVE_VIEW_TOOLBAR_SHOW_COMPACT", systemImage: isShowingCompactInLiveView ? "rectangle.grid.1x2" : "list.bullet")
            }
        } label: {
            Label("Display Settings", systemImage: "ellipsis")
        }
    }
}

struct LiveViewToolbar_Previews: PreviewProvider {
    static var previews: some View {
        LiveViewToolbar()
    }
}
