//
//  VideoStackView.swift
//  holo-wtf
//
// 
//

import SwiftUI

struct VideoStackView: View {
    @State var path = NavigationPath() // ViewAgency
    @EnvironmentObject var appDelegate: AppDelegate
    let videoType: VideoType
    
    var body: some View {
        NavigationStack(path: $path) {
            AgencyNavigationView(viewTitle: videoTypeToViewTitleAndIcon[videoType]!.0) { agency in
                VideoView(for: agency, videoType: videoType)
            } favouritesView: {
                VideoFavouritesView(videoType: videoType)
            }
            .onOpenURL { url in
                guard let unwrappedAgency = widgetDeepLinkUrlParseAgency(url: url) else { return }
                path.append(unwrappedAgency)
            }
            .onChange(of: appDelegate.id, perform: { _ in
                if let viewAgency = appDelegate.agency {
                    guard videoType == .upcoming else { return }
                    
                    if path.count > 0 {
                        path.removeLast(1)
                    }
                    path.append(viewAgency)
                }
            })
        }
    }
}

struct VideoStackView_Previews: PreviewProvider {
    static var previews: some View {
        VideoStackView(videoType: .live)
    }
}
