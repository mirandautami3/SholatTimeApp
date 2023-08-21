//
//  NotificationManager.swift
//  SholatTimeApp
//
//  Created by miranda on 21/08/23.
//

import SwiftUI
import UserNotifications

class NotificationManager: ObservableObject {
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else if let error = error {
                print("Notification authorization denied: \(error.localizedDescription)")
            }
        }
    }
    
    // Tambahkan fungsi untuk mengatur notifikasi kustom
    func scheduleCustomNotification(at time: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Waktu Sholat"
        content.body = "Waktunya sholat kustom!"
        content.sound = .default
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling custom notification: \(error.localizedDescription)")
            } else {
                print("Custom notification scheduled successfully")
            }
        }
    }
}

