//
//  LiveHeartRateApp.swift
//  LiveHeartRate Watch App
//
//  Created by Lucky on 30/05/24.
//

import SwiftUI

@main
struct LiveHeartRate_Watch_AppApp: App {
    
    @StateObject private var healthKitManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            if healthKitManager.isAuthorized {
                HeartRateView()
            } else {
                Text("Requesting Health Data Access...")
                    .onAppear {
                        // Request authorization for HealthKit access when the app launches.
                        healthKitManager.requestAuthorization()
                    }
            }
        }
    }
}
