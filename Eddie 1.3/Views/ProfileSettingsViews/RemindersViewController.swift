//
//  RemindersViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 14/02/2022.
//

import UIKit
import UserNotifications

class RemindersViewController: UIViewController, UNUserNotificationCenterDelegate {

    @IBOutlet weak var reminderView1: UIView!
    @IBOutlet weak var reminderView2: UIView!
    @IBOutlet weak var reminderView3: UIView!
    @IBOutlet weak var reminderView4: UIView!
    @IBOutlet weak var reminderView5: UIView!
    var receivedData = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleRemnder(reminderView: reminderView1)
        styleRemnder(reminderView: reminderView2)
        styleRemnder(reminderView: reminderView3)
        styleRemnder(reminderView: reminderView4)
        styleRemnder(reminderView: reminderView5)

        print(receivedData)
        
//        sendNotification()
    }
    
    func styleRemnder(reminderView: UIView) {
        reminderView.layer.cornerRadius = 10
        reminderView.layer.masksToBounds = true
    }
//    func sendNotification() {
//        //Notification-----------------------------------------------------------------------------
//        let center = UNUserNotificationCenter.current()
//        UNUserNotificationCenter.current().delegate = self
//        center.delegate = self
//        center.requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
//            if error == nil {
//                print("User permission is granted : \(granted)")
//            }
//        }
//
//        let request = createNotification( title: "First Notification", body: "1.notificatio body", hour: 15, minute: 34)
//        let request2 = createNotification( title: "Second Notification", body: "2.notificatio body", hour: 15, minute: 35)
//        //Step-5 Register with Notification Center
//        center.add(request) { error in
//        }
//        center.add(request2) { error in
//        }
//
//        func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                    willPresent notification: UNNotification,
//                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//            completionHandler([.sound,.banner])
//        }
//        //End of notification--------------------------------------------------------------------
//    }
//
//    func createNotification(title: String, body: String, hour: Int, minute: Int) -> UNNotificationRequest  {
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = UNNotificationSound.defaultRingtone
//        content.badge = 1
//        // date
//        var dateComponents = DateComponents()
//        dateComponents.hour = hour
//        dateComponents.minute = minute
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        let uuid = UUID().uuidString
//        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
//        return request
//
//    }


}
