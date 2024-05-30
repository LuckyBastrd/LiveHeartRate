//
//  HeartRateManager.swift
//  LiveHeartRate Watch App
//
//  Created by Lucky on 30/05/24.
//

import HealthKit

class HeartRateManager {
    
    static let shared = HeartRateManager()
    
    private let healthStore = HKHealthStore()
    
    func startHeartRateQuery(completion: @escaping ([HKSample]?) -> Void) {
        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: Date(), end: nil, options: .strictStartDate)
        
        let query = HKAnchoredObjectQuery(type: heartRateType, predicate: predicate, anchor: nil, limit: HKObjectQueryNoLimit) { (query, samples, deletedObjects, newAnchor, error) in
            completion(samples)
        }
        
        query.updateHandler = { (query, samples, deletedObjects, newAnchor, error) in
            completion(samples)
        }
        
        healthStore.execute(query)
    }
}
