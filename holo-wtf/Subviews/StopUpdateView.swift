//
//  StopUpdateView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct StopUpdateView: View {
    @AppStorage(UserDefaultKeys.isShowingStopUpdate) var isShowingStopUpdate = true
    
    @State var isShowing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text("**HoloCal will no longer be updated after March 24, 2024**")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isShowingStopUpdate = false
                        isShowing = false
                    }
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.secondary)
                })
                .buttonStyle(.borderless)
            }
            .padding(.bottom)
            
            Text("HoloCal will no longer be available on the App Store after March 24, 2024. Core features, except concerts, will continue to be available. [Learn more.](https://github.com/Skk-tj/HoloCal/blob/main/FINAL.md)")
            
            Text("You must also provide your own Holodex API key in Settings.")
        }
        .padding()
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    StopUpdateView()
}
