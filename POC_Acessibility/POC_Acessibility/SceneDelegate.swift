//
//  SceneDelegate.swift
//  POC_Acessibility
//
//  Created by Camila Campana on 28/10/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            
            window.rootViewController = UINavigationController(rootViewController: MainViewController())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

