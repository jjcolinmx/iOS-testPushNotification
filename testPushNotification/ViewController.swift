//
//  ViewController.swift
//  testPushNotification
//
//  Created by Juan Jose Colin on 2/20/18.
//  Copyright © 2018 Juan Jose Colin. All rights reserved.
//

import UIKit

import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initNotificationSetupCheck()
        getNotificationSettings()
    }

    @IBAction func buttonNotificacionTouch(_ sender: Any) {
        
        print("Button was tapped")
        
         let mynotification = UNMutableNotificationContent()
         mynotification.title="Danger"
         mynotification.subtitle="Something comes"
         mynotification.body="In need to tell you something, but first read this"
         
         let mynotificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let myrequest=UNNotificationRequest(identifier: "Notification1", content: mynotification, trigger: mynotificationTrigger)
         
         UNUserNotificationCenter.current().add(myrequest, withCompletionHandler: nil)
 
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]){
            (success,error) in
            if success {
                print("Permission Granted")
            }else{
                print("Permission Denied")
            }
            
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
        }
    }
}

