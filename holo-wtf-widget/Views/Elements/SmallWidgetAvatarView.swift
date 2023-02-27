//
//  SmallWidgetAvatarView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct SmallWidgetAvatarView: View {
    let avatarData: Data
    
    var body: some View {
        if let avatarImage = UIImage(data: avatarData) {
            Image(uiImage: avatarImage)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 1)
                }
                .shadow(radius: 1)
        } else {
            Image(systemName: "person")
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 1)
                }
                .shadow(radius: 1)
        }
    }
}

struct SmallWidgetAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetAvatarView(avatarData: Data())
    }
}
