//
//  HealthKitManager.swift
//  LiveHeartRate Watch App
//
//  Created by Lucky on 30/05/24.
//

import HealthKit

class HealthKitManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    @Published var isAuthorized: Bool = false

    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else {
            return
        }
        
        let sampleTypesToRead = Set([
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
        ])
        
        healthStore.requestAuthorization(toShare: nil, read: sampleTypesToRead) { (success, error) in
            DispatchQueue.main.async {
                if success {
                    self.isAuthorized = true
                } else {
                    self.isAuthorized = false
                }
            }
        }
    }
}
