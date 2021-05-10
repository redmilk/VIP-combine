//
//  SceneDelegate.swift
//  VIPexample
//
//  Created by Admin on 10.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: scene)
        
        //print(MD5())
        let coordinator = AuthCoordinator(window: window!)
        coordinator.start()
    }
}

