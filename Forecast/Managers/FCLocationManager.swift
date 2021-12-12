//
//  FCLocationManager.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/9/21.
//

import SwiftUI
import CoreLocation

final class FCLocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    // MARK: - Properties
    private let locationManager = CLLocationManager()
    
    @Published var location     : CLLocationCoordinate2D?
    @Published var isLoading    = false
    
    // MARK: - Init
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    // MARK: - Methods
    func requestLocation() {
        withAnimation { isLoading = true }
        locationManager.requestLocation()
    }
    
    // MARK: - Delegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        withAnimation { isLoading = false }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("[!] Error getting a location fix:", error.localizedDescription)
        withAnimation { isLoading = false }
    }
}
