//
//  NetworkErrorView.swift
//  holo-wtf
//
//
//

import SwiftUI

struct NetworkErrorView: View {
    var body: some View {
        Spacer()
        Image(systemName: "xmark.circle")
            .foregroundColor(.secondary)
            .font(.largeTitle)
        Text("NETWORK_ERROR")
            .foregroundColor(.secondary)
        Spacer()
    }
}

struct NetworkErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkErrorView()
    }
}
