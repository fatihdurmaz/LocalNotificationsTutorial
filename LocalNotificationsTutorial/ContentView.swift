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
                            // Request Notification Permissions
                            
                            Task {
                                
                                let authorizationCenter = UNUserNotificationCenter.current()
                                
                                do {
                                    
                                    let success = try await authorizationCenter.requestAuthorization(options: [.alert, .badge, .sound])
                                    
                                    if success {
                                        print("İzin verildi!")
                                    }else {
                                        print("İzin verilmedi!")
                                    }
                                    
                                } catch {
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
                            // Send Local Notifications
                            
                            Task {
                                
                                let content  = UNMutableNotificationContent()
                                content.title = "Bildirim Başlığı"
                                content.subtitle = "Bildirim mesajı veya içeriği"
                                content.sound = UNNotificationSound.default
                                
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                
                                
                                do {
                                    try await UNUserNotificationCenter.current().add(request)
                                    
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                            
                            
                        }, label: {
                            Label("Bildirim Gönder", systemImage: "2.circle.fill")
                                .font(.title2)
                        })
                        .tint(.green)
                        Spacer()
                        Image(systemName: "arrow.forward")
                    }
                    
                    
                    HStack {
                        Button(action: {
                            // Send Local Notifications by Date or Time
                            
                            Task {
                                let content  = UNMutableNotificationContent()
                                content.title = "Bildirim Başlığı"
                                content.subtitle = "Bildirim mesajı veya içeriği"
                                content.sound = UNNotificationSound.default
                                
                                var dateComponent = DateComponents()
                                dateComponent.calendar = Calendar.current
                                
                                dateComponent.weekday = 1
                                dateComponent.hour = 12
                                
                                
                                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
                                
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                                
                                
                                do {
                                    try await UNUserNotificationCenter.current().add(request)
                                    
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                            
                            
                        }, label: {
                            Label("Tarih ve Saate Göre Bildirim Gönder", systemImage: "3.circle.fill")
                                .font(.title2)
                        })
                        .tint(.red)
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
