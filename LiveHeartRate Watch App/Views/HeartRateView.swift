//
//  HeartRateView.swift
//  LiveHeartRate Watch App
//
//  Created by Lucky on 30/05/24.
//

import SwiftUI

struct HeartRateView: View {
    
    @StateObject private var heartRateViewModel = HeartRateViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: heartRateViewModel.heartRateModel.heartRate == 0 ? 0 : 7) {
                Text(heartRateViewModel.heartRateModel.heartRate == 0 ? "--" : "\(Int(heartRateViewModel.heartRateModel.heartRate))")
                    .font(.system(size: 33))
                    .fontWeight(.medium)
                    .frame(width: heartRateViewModel.heartRateModel.heartRate == 0 ? 25 : 50, height: 22)
                
                HStack(spacing: 1) {
                    Text("BPM")
                        .font(.system(size: 33))
                        .fontWeight(.medium)
                        .kerning(0.5)
                        .foregroundColor(.white)
                    
                    Image(systemName: "heart.fill")
                        .font(.system(size: 20))
                        .kerning(0.5)
                        .foregroundColor(.red)
                        .frame(width: 24, height: 22)
                        .opacity(0.98)
                }
            }
            .frame(width: 172, height: 22, alignment: .center)
            .onAppear {
                heartRateViewModel.startHeartRateQuery()
            }
        }
    }
}

#Preview {
    HeartRateView()
}
