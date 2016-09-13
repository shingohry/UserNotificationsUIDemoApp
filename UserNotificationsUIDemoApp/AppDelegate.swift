//
//  AppDelegate.swift
//  UserNotificationsUIDemoApp
//
//  Created by hiraya.shingo on 9/5/16.
//  Copyright © 2016 Shingo Hiraya. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    // MARK: - Properties
    
    var window: UIWindow?
    
    // MARK: - UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            print("granted:\(granted)")
        }
        
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        print("[contains app] notification identifier: \(response.notification.request.identifier)")
        print("[contains app] actionIdentifier: \(response.actionIdentifier)")
        print("[contains app] categoryIdentifier: \(response.notification.request.content.categoryIdentifier)")
        
        if let textInputResponse = response as? UNTextInputNotificationResponse {
            print("[contains app] userText:\(textInputResponse.userText)")
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
