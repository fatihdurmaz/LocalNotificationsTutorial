//
//  LocalNotificationsTutorialApp.swift
//  LocalNotificationsTutorial
//
//  Created by Fatih Durmaz on 03.06.2024.
//

import SwiftUI

@main
struct LocalNotificationsTutorialApp: App {
    
    init(){
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = apperance
        UINavigationBar.appearance().scrollEdgeAppearance = apperance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
