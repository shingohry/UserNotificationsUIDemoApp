//
//  NotificationViewController.swift
//  FourthNotificationContentExtension
//
//  Created by 平屋真吾 on 2016/09/13.
//  Copyright © 2016 Shingo Hiraya. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    // MARK: - Properties
    
    @IBOutlet var label: UILabel?
    
    var mediaPlayPauseButtonType: UNNotificationContentExtensionMediaPlayPauseButtonType {
        get {
            return .default
        }
    }
    
    var mediaPlayPauseButtonFrame: CGRect {
        get {
            return CGRect(x: 0.0, y: 0.0, width: 100.0, height: 50.0)
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    // MARK: - UNNotificationContentExtension
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }
    
    func mediaPlay() {
        print(Date(), #function, #line)
        
    }
    
    func mediaPause() {
        print(Date(), #function, #line)
        
    }
}
