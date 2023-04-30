//
//  TextRollingView.swift
//  holo-wtf
//
//  Created by Haoyi An on 2023-04-23.
//

import SwiftUI

struct TextRollingView: View {
    @State var degree: CGFloat = 0.0
    
    var body: some View {
        Text("TESTING")
            .onAppear {
                withAnimation {
                    degree = 360.0
                }
            }
            .font(.largeTitle)
            .rotation3DEffect(.degrees(degree), axis: (x: 1, y: 0, z: 0))
            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: degree)
    }
}

struct TextRollingView_Previews: PreviewProvider {
    static var previews: some View {
        TextRollingView()
    }
}
