//
//  UpcomingViewToolbar.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-04-09.
//

import SwiftUI

struct UpcomingViewToolbar: View {
    @AppStorage(UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView) var isShowingAbsoluteTime: Bool = false
    
    var body: some View {
        Menu {
            Button {
                isShowingAbsoluteTime.toggle()
                UserDefaults.standard.set(isShowingAbsoluteTime, forKey: UserDefaultKeys.isShowingAbsoluteTimeInUpcomingView)
            } label: {
                Label(isShowingAbsoluteTime ? "LIVE_VIEW_TOOLBAR_SHOW_RELATIVE" : "LIVE_VIEW_TOOLBAR_SHOW_ABSOLUTE", systemImage: "clock")
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
