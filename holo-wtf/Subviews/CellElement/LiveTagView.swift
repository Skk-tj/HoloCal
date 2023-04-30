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
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "person.wave.2.fill", variableValue: liveIconOpcality)
                .onAppear {
                    withAnimation {
                        liveIconOpcality = 1
                    }
                }
            Text("LIVE")
        }
        .padding(5)
        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 5, style: .continuous))
        .font(.caption)
        .foregroundColor(.red)
        .animation(.easeInOut(duration: 1).repeatForever(), value: liveIconOpcality)
    }
}

struct LiveTagView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTagView()
    }
}
