//
//  ViewController.swift
//  UserNotificationsUIDemoApp
//
//  Created by hiraya.shingo on 9/5/16.
//  Copyright © 2016 Shingo Hiraya. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UITableViewController {
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
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.addDefaultNotification()
        } else if indexPath.row == 1 {
            self.addNotificationWithAttachment()
        } else if indexPath.row == 2 {
            self.addNotificationWithAction()
        } else {
            self.addNotificationWithMediaPlay()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Private
    
    func addDefaultNotification() {
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
    
    func addNotificationWithAttachment() {
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
    
    func addNotificationWithAction() {
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
    
    func addNotificationWithMediaPlay() {
        let content = UNMutableNotificationContent()
        content.title = "Hey guys"
        content.body = "Let's play!"
        content.categoryIdentifier = "mediaPlayCategory"
        
        let imageURL = Bundle.main.url(forResource: "loop",
                                       withExtension: "aif")
        do {
            let attachment = try UNNotificationAttachment(identifier: "music",
                                                          url: imageURL!,
                                                          options: nil)
            content.attachments = [attachment]
        } catch  {
            print("make attachment error!")
        }
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5,
                                                             repeats: false)
        let request = UNNotificationRequest.init(identifier: "mediaPlayNotification",
                                                 content: content,
                                                 trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
