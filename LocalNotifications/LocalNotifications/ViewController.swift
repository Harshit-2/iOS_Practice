//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Harshit ‎ on 1/31/25.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    let notificationCenter = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForPermission()
    }
    
    func checkForPermission() {
        
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.dispatchNotification()
            
            case .denied:
                return
                
            case .notDetermined:
                self.notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
    }
    
    func dispatchNotification() {
        let identifier = "birthdayNotification"
        let title = "Happy Birthday!"
        let body = "Wishing you a very happy birthday!"
        let hour = 1
        let minute = 25
        let isDaily = false
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        var dateComponent = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current)
        dateComponent.hour = hour
        dateComponent.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }


}

