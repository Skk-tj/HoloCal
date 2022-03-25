//
//  LiveViewToolbar.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-03-25.
//

import SwiftUI

struct VideoViewToolbar: View {
    var userDefaultSettingsKey: String
    @Binding var isShowingAbsoluteTime: Bool
    
    var body: some View {
        Menu {
            Button {
                isShowingAbsoluteTime.toggle()
                
                let defaults = UserDefaults.standard
                defaults.set(isShowingAbsoluteTime, forKey: "isShowingAbsoluteTimeInLiveView")
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
        VideoViewToolbar(
            userDefaultSettingsKey: "isShowingAbsoluteTimeInLiveView",
            isShowingAbsoluteTime: Binding.constant(false)
        )
    }
}
