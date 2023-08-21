//
//  SholatTimeAppApp.swift
//  SholatTimeApp
//
//  Created by miranda on 21/08/23.
//

import SwiftUI


@main
struct SholatTimeApp: App {
    @StateObject var notificationManager = NotificationManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(notificationManager)
                .onAppear {
                    notificationManager.requestNotificationAuthorization()
                }
        }
    }
}
