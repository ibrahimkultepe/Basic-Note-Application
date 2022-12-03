//
//  AppDelegate.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.09.2022.
//

import UIKit
import IQKeyboardManagerSwift
import Parse

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = RegisterViewModel()
        let viewController = RegisterViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        IQKeyboardManager.shared.enable = true
        // MARK: - Back4app Network Test
        let configuration = ParseClientConfiguration {
            $0.applicationId = "R0gyHddyhjaxvQeZrJRDhCF3MSwulWgfKikaofNL"
            $0.clientKey = "mUCDl9NFQOIyJTuTZxSRm4cYMe7aiTgCdeOLyuDo"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

