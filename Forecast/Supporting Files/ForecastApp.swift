//
//  ForecastApp.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/9/21.
//

import SwiftUI

@main
struct ForecastApp: App {
    @StateObject var locationManager = FCLocationManager()
    
    var body: some Scene {
        WindowGroup {
            if let _ = locationManager.location {
                FCHomeView()
                    .environmentObject(locationManager)
            } else {
                FCWelcomeView()
                    .environmentObject(locationManager)
            }
        }
    }
}
