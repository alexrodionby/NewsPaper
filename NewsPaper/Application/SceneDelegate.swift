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
    //   let navigationController = UINavigationController(rootViewController: BookmarksViewController())
        var controller = UIViewController()
        if LocalStorageService.shared.loggedIn() == false {
            controller = OnboardingViewController()
        } else {
            controller = TabBarViewController()
        }
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
    }
}
