//
//  HeartRateViewModel.swift
//  LiveHeartRate Watch App
//
//  Created by Lucky on 30/05/24.
//

import Foundation
import HealthKit

class HeartRateViewModel: ObservableObject {
    
    @Published var heartRateModel: HeartRateModel = HeartRateModel(heartRate: 0.0)
    
    func startHeartRateQuery() {
        HeartRateManager.shared.startHeartRateQuery { [weak self] samples in
            self?.process(samples)
        }
    }
    
    private func process(_ samples: [HKSample]?) {
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }

        DispatchQueue.main.async {
            self.heartRateModel.heartRate = samples.last?.quantity.doubleValue(for: .count().unitDivided(by: .minute())) ?? 0.0
        }
    }
}
