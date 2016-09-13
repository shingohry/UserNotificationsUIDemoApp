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
import AVFoundation

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    // MARK: - Properties
    
    @IBOutlet var label: UILabel?
    var player: AVAudioPlayer?
    
    var mediaPlayPauseButtonType: UNNotificationContentExtensionMediaPlayPauseButtonType {
        get {
            /**
             none:
                No media button. Specify this option when you do not want a media button. This is the default option.
             `default`:
                A standard play/pause button. This button is always visible. When tapped, its appearance changes between the play and  pause icons and triggers the appropriate play and pause actions.
             overlay:
                A partially transparent play/pause button that is layered on top of your media content. This button draws a play icon over the content initially. When playback begins, the button disappears. Tapping the content again pauses playback and displays the play button again.
            */
            return .overlay
        }
    }
    
    var mediaPlayPauseButtonFrame: CGRect {
        get {
            return CGRect(x: 20.0, y: 10.0, width: 30.0, height: 30.0)
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
        
        if let attachment = notification.request.content.attachments.first {
            if attachment.url.startAccessingSecurityScopedResource() {
                do {
                    try self.player = AVAudioPlayer(contentsOf: attachment.url)
                } catch {
                    print("prepare player error!")
                }
                
                attachment.url.stopAccessingSecurityScopedResource()
            }
        }
    }
    
    func mediaPlay() {
        print(Date(), #function, #line)
        guard let player = self.player else { return }
        
        player.play()
    }
    
    func mediaPause() {
        print(Date(), #function, #line)
        guard let player = self.player else { return }
        
        player.pause()
    }
}
