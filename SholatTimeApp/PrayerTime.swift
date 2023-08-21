//
//  PrayerTime.swift
//  SholatTimeApp
//
//  Created by miranda on 21/08/23.
//

import Foundation

struct PrayerTime: Identifiable {
    var id = UUID()
    var name: String
    var time: String
}

extension Date {
    func timeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
}

let samplePrayerTimes: [PrayerTime] = [
    PrayerTime(name: "Subuh", time: "04:30 AM"),
    PrayerTime(name: "Dzuhur", time: "12:00 PM"),
    PrayerTime(name: "Ashar", time: "02:57 PM"),
    PrayerTime(name: "Maghrib", time: "06:45 PM"),
    PrayerTime(name: "Isya", time: "08:00 PM")
]


