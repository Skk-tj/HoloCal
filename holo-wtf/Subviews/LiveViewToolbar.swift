//
//  LiveViewToolbar.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInLiveView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        Menu {
            Button {
                isShowingAbsoluteTime.toggle()
                UserDefaults.standard.set(isShowingAbsoluteTime, forKey: UserDefaultKeys.isShowingAbsoluteTimeInLiveView)
            } label: {
                Label(isShowingAbsoluteTime ? "LIVE_VIEW_TOOLBAR_SHOW_RELATIVE" : "LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
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
