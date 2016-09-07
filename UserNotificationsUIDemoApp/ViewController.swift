//
//  ViewController.swift
//  UserNotificationsUIDemoApp
//
//  Created by hiraya.shingo on 9/5/16.
//  Copyright © 2016 Shingo Hiraya. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let category = UNNotificationCategory(identifier: "myNotificationCategory",
                                              actions: [],
                                              intentIdentifiers: [],
                                              options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action
    
    @IBAction func addDefaultNotificationButtonDidTap(_ sender: AnyObject) {
        let content = UNMutableNotificationContent()
        content.title = "Hey guys"
        content.body = "What's going on here?"
        content.categoryIdentifier = "myNotificationCategory"
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5,
                                                             repeats: false)
        let request = UNNotificationRequest.init(identifier: "myNotification",
                                                 content: content,
                                                 trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
