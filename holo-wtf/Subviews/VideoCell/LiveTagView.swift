//
//  LiveTagView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct LiveTagView: View {
    @State var liveIconOpcality: Double = 0
    
    var body: some View {
        HStack(alignment: .top, spacing: 2) {
            Image(systemName: "circle.fill")
                .onAppear {
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                        liveIconOpcality = 1
                    }
                }
                .opacity(liveIconOpcality)
            Text("LIVE")
        }
        .padding(5)
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
        .font(.caption)
        .foregroundColor(.red)
        .padding(.top)
        .padding(.leading)
    }
}

struct LiveTagView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTagView()
    }
}
