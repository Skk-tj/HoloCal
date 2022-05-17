//
//  ViewUtil.swift
//  holo-wtf
//
//  Created by Haoyi An on 2022-05-14.
//

import Foundation
import UIKit

func shareSheet(url: String) {
    let url = URL(string: url)
    let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
    
    let allScenes = UIApplication.shared.connectedScenes
    let scene = allScenes.first { $0.activationState == .foregroundActive }
    
    if let windowScene = scene as? UIWindowScene {
        let rootViewController = (windowScene.windows).first(where: { $0.isKeyWindow })?.rootViewController
        
        // iPad stuff (fine to leave this in for all iOS devices, it will be effectively ignored when not needed)
        activityView.popoverPresentationController?.sourceView = rootViewController?.view
        activityView.popoverPresentationController?.sourceRect = .zero
        
        rootViewController?.present(activityView, animated: true, completion: nil)
    }
}
