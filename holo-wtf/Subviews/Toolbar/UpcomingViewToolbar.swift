//
//  UpcomingViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct UpcomingViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    @AppStorage(UserDefaultKeys.isShowingCompactInUpcomingView) var isShowingCompactInUpcomingView: Bool = false
    
    var body: some View {
        Menu {
            Button {
                isShowingAbsoluteTime.toggle()
                UserDefaults.standard.set(isShowingAbsoluteTime, forKey: UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView)
            } label: {
                Label(isShowingAbsoluteTime ? "LIVE_VIEW_TOOLBAR_SHOW_RELATIVE" : "LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
            }
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                Button {
                    isShowingCompactInUpcomingView.toggle()
                    UserDefaults.standard.set(isShowingCompactInUpcomingView, forKey: UserDefaultKeys.isShowingCompactInUpcomingView)
                } label: {
                    Label(isShowingCompactInUpcomingView ? "LIVE_VIEW_TOOLBAR_SHOW_CARD" : "LIVE_VIEW_TOOLBAR_SHOW_COMPACT", systemImage: isShowingCompactInUpcomingView ? "rectangle.grid.1x2" : "list.bullet")
                }
            }
        } label: {
            Label("Display Settings", systemImage: "ellipsis")
        }
    }
}

struct UpcomingViewToolbar_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingViewToolbar()
    }
}
