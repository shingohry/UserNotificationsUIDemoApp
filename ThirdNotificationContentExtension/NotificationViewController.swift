//
//  NotificationViewController.swift
//  ThirdNotificationContentExtension
//
//  Created by 平屋真吾 on 2016/09/13.
//  Copyright © 2016 Shingo Hiraya. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        print(Date(), #function, #line)
        
        self.label?.text = notification.request.content.body
    }
    
    func didReceive(_ response: UNNotificationResponse,
                    completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Swift.Void) {
        print(Date(), #function, #line)
        
        print("response.actionIdentifier:\(response.actionIdentifier)")
        
        // get userText
        if let textInputResponse = response as? UNTextInputNotificationResponse {
            print("userText:\(textInputResponse.userText)")
        }
        
        // .doNotDismiss: Do not dismiss the notification interface. The content extension handles the selected action.
        // .dismiss: Dismiss the notification interface. The content extension handles the selected action.
        // .dismissAndForwardAction: Dismiss the notification interface and forward the notification to the app. Choose this option when you want the app to respond to the action or handle it.
        completion(.dismiss)
    }
}
