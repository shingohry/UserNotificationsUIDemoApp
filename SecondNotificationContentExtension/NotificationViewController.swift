//
//  NotificationViewController.swift
//  SecondNotificationContentExtension
//
//  Created by hiraya.shingo on 9/7/16.
//  Copyright © 2016 Shingo Hiraya. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var bodyLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("self.preferredContentSize:\(self.preferredContentSize)")
    }
    
    func didReceive(_ notification: UNNotification) {
        let content = notification.request.content
        
        self.titleLabel?.text = content.title
        self.bodyLabel?.text = content.body
        
        if let attachment = content.attachments.first {
            if attachment.url.startAccessingSecurityScopedResource() {
                self.imageView.image = UIImage(contentsOfFile: attachment.url.path)
                attachment.url.stopAccessingSecurityScopedResource()
            }
        }
    }
}
