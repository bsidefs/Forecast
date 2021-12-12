//
//  FCWelcomeView.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/10/21.
//

import SwiftUI
import CoreLocationUI

struct FCWelcomeView: View {
    @EnvironmentObject var locationManager  : FCLocationManager
    @State private var isViewAnimating      = false
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: 20) {
                    Text("Welcome to Forecast.")
                        .font(.title)
                        .fontWeight(.medium)
                    
                    Text("Please share your location to view the weather for your area.")
                        .padding()
                    
                    LocationButton(.shareMyCurrentLocation) {
                        locationManager.requestLocation()
                    }
                    .cornerRadius(30)
                }
                .padding()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .offset(y: isViewAnimating ? 0 : 100)
                .opacity(isViewAnimating ? 1 : 0)
                .onAppear {
                    withAnimation(.spring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.50)) {
                        isViewAnimating = true
                    }
                }
                
                if locationManager.isLoading {
                    FCLoadingView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.fcBackgroundColor)
    }
}

struct FCWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        FCWelcomeView()
            .preferredColorScheme(.dark)
            .environmentObject(FCLocationManager())
    }
}
