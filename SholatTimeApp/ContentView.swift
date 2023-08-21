//
//  ContentView.swift
//  SholatTimeApp
//
//  Created by miranda on 21/08/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    @State private var customTime = Date() // Tambahkan state untuk waktu kustom
    @State private var selectedIndex = 0 // Tambahkan state untuk indeks waktu yang akan diubah
    @State private var customPrayerTime = "" // Tambahkan state untuk waktu kustom dalam format string
    @State private var prayerTimes: [PrayerTime] // Jadikan ini sebuah state

    init() {
        self._prayerTimes = State(initialValue: samplePrayerTimes)
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedIndex, label: Text("Pilih Waktu Sholat")) {
                    ForEach(0..<prayerTimes.count, id: \.self) { index in
                        Text(prayerTimes[index].name).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                TextField("Waktu Kustom", text: $customPrayerTime)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Set Custom Prayer Time") {
                    if selectedIndex >= 0 && selectedIndex < prayerTimes.count {
                        // Buat salinan baru dari PrayerTime dengan waktu yang diperbarui
                        var updatedPrayerTime = prayerTimes[selectedIndex]
                        updatedPrayerTime.time = customPrayerTime
                        // Gantikan elemen lama dalam array
                        prayerTimes[selectedIndex] = updatedPrayerTime
                    }
                }

                
                List(prayerTimes, id: \.name) { prayerTime in
                        NavigationLink(destination: PrayerDetailView(prayerTime: prayerTime)) {
                            VStack(alignment: .leading) {
                                Text(prayerTime.name)
                                Text(prayerTime.time)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
            }
            .navigationTitle("Waktu Sholat")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NotificationManager())
    }
}
