//
//  PrayerDetailView.swift
//  SholatTimeApp
//
//  Created by miranda on 21/08/23.
//

import SwiftUI
import UserNotifications

struct PrayerDetailView: View {
    var prayerTime: PrayerTime

    var body: some View {
        VStack {
            Text(prayerTime.name)
                .font(.largeTitle)
            Text(prayerTime.time)
                .font(.title)
                .foregroundColor(.secondary)
            Spacer()
            
            Button("Atur Notifikasi") {
               scheduleNotification(for: prayerTime)
            }

        }
        .navigationBarTitle(Text(prayerTime.name), displayMode: .inline)
    }
    
    // Fungsi untuk mengatur notifikasi
    func scheduleNotification(for prayerTime: PrayerTime) {
        print("Scheduling notification for \(prayerTime.name) at \(prayerTime.time)")

        let content = UNMutableNotificationContent()
        content.title = "Waktu Sholat"
        content.body = "Waktunya sholat \(prayerTime.name)!"
        content.sound = .default
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        if let date = dateFormatter.date(from: prayerTime.time) {
            let calendar = Calendar.current
            let dateComponents = calendar.dateComponents([.hour, .minute], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully")
                }
            }
        }
    }
}

struct PrayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PrayerDetailView(prayerTime: PrayerTime(name: "Subuh", time: "04:30 AM"))
    }
}
