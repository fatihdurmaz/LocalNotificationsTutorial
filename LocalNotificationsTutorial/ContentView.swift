//
//  ContentView.swift
//  LocalNotificationsTutorial
//
//  Created by Fatih Durmaz on 03.06.2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    HStack {
                        Button(action: {
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    print("İzin verildi!")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                            }
                        }, label: {
                            Label("Bildirim İzni İste", systemImage: "1.circle.fill")
                                .font(.title2)
                        })
                        .tint(.orange)
                        Spacer()
                        Image(systemName: "arrow.forward")
                    }

                    
                    HStack {
                        Button(action: {
                            // Bildirim içeriğini oluştur.
                            let content = UNMutableNotificationContent()
                            content.title = "Bildirim Başlığı"
                            content.subtitle = "Bildirim mesajı veya içeriği."
                            content.sound = UNNotificationSound.default
                            
                            // Bildirimin ne zaman gönderileceğini hazırlamak için tetikleyici oluştur.
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                            
                            // Bildirim isteğini oluştur.
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            
                            // Bildirimi, bildirim merkezine ekle.
                            UNUserNotificationCenter.current().add(request)
                            
                        }, label: {
                            Label("Bildirim Gönder", systemImage: "2.circle.fill")
                                .font(.title2)
                        })
                        .tint(.red)
                        Spacer()
                        Image(systemName: "arrow.forward")
                    }

                    
                    HStack {
                        Button(action: {
                            // Bildirim içeriğini oluştur.
                            let content = UNMutableNotificationContent()
                            content.title = "Bildirim Başlığı"
                            content.subtitle = "Bildirim mesajı veya içeriği."
                            content.sound = UNNotificationSound.default
                            
                            var dateComponents = DateComponents()
                            dateComponents.calendar = Calendar.current // Cihazın takvimini kullanacak.

                            dateComponents.weekday = 1  // Hangi gün
                            dateComponents.hour = 12    // Hangi saat
                            
                            // Bildirimin ne zaman gönderileceğini hazırlamak için tetikleyici oluştur.
                            let trigger = UNCalendarNotificationTrigger(
                                     dateMatching: dateComponents, repeats: true)
                            
                            // Bildirim isteğini oluştur.
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            
                            // Bildirimi, bildirim merkezine ekle.
                            UNUserNotificationCenter.current().add(request)

                            
                        }, label: {
                            Label("Tarih ve Saate Göre Bildirim Gönder", systemImage: "3.circle.fill")
                                .font(.title2)
                        })
                        .tint(.green)
                        Spacer()
                        Image(systemName: "arrow.forward")
                    }

                }
                .contentMargins(10)
            }
            .navigationTitle("Local Notifications")
        }
    }
}

#Preview {
    ContentView()
}
