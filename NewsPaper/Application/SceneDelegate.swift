//
//  SceneDelegate.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 6.05.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let controller = UINavigationController(rootViewController: DetailNewsViewController())
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
