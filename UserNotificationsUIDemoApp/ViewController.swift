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
        
        let myNotificationCategory = UNNotificationCategory(identifier: "myNotificationCategory",
                                              actions: [],
                                              intentIdentifiers: [],
                                              options: [])
        
        let withAttachmentCategory = UNNotificationCategory(identifier: "withAttachmentCategory",
                                              actions: [],
                                              intentIdentifiers: [],
                                              options: [])
        
        let textInputAction = UNTextInputNotificationAction(identifier: "textInputActionId",
                                                            title: "TextInput",
                                                            options:[],
                                                            textInputButtonTitle: "Send",
                                                            textInputPlaceholder: "Enter Text")
        let replyAction = UNNotificationAction(identifier:"replyActionId",
                                               title:"Reply",
                                               options:[])
        let deleteAction = UNNotificationAction(identifier:"deleteActionIdentifier",
                                                title:"Delete",
                                                options:[.destructive, .authenticationRequired])
        let withActionCategory = UNNotificationCategory(identifier: "withActionCategory",
                                                        actions: [textInputAction, replyAction, deleteAction],
                                                        intentIdentifiers: [],
                                                        options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([myNotificationCategory, withAttachmentCategory, withActionCategory])
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
    
    @IBAction func addNotificationWithAttachmentButtonDidTap(_ sender: AnyObject) {
        let content = UNMutableNotificationContent()
        content.title = "Rich notifications"
        content.body = "View photos and videos or respond to a message right in your notifications."
        content.categoryIdentifier = "withAttachmentCategory"
        
        let imageURL = Bundle.main.url(forResource: "image",
                                       withExtension: "jpg")
        do {
            let attachment = try UNNotificationAttachment(identifier: "SampleAttachment",
                                                          url: imageURL!,
                                                          options: nil)
            content.attachments = [attachment]
        } catch  {
            print("make attachment error!")
        }
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5,
                                                             repeats: false)
        let request = UNNotificationRequest.init(identifier: "withAttachmentNotification",
                                                 content: content,
                                                 trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    @IBAction func addNotificationWithActionButtonDidTap(_ sender: AnyObject) {
        let content = UNMutableNotificationContent()
        content.title = "Hey guys"
        content.body = "What's going on here?"
        content.categoryIdentifier = "withActionCategory"
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5,
                                                             repeats: false)
        let request = UNNotificationRequest.init(identifier: "withActionNotification",
                                                 content: content,
                                                 trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
