//
//  FCHomeViewModel.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/10/21.
//

import SwiftUI
import Combine
import CoreLocation

final class FCHomeViewModel: ObservableObject {
    // MARK: - Properties
    @Published var forecast : FCForecast?
    
    var weatherManager      : FCWeatherManager
    private var cancellable : AnyCancellable?
    
    // MARK: - Init
    init(weatherManager: FCWeatherManager) {
        self.weatherManager = weatherManager
    }
    
    // MARK: - Methods
    func getCurrentWeather(latitude: CLLocationDegrees?, longtitude: CLLocationDegrees?) {
        if let latitude = latitude, let longtitude = longtitude {
            do {
                cancellable = try weatherManager.getCurrentWeather(latitude: latitude, longtitude: longtitude)
                    .sink { _ in
                        print("[+] Completed fetching current weather")
                    } receiveValue: { forecast in
                        withAnimation { self.forecast = forecast }
                    }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

/* mock data
 FCForecast(weather: [FCWeatherResponse(status: "Clear", description: "Clear skies")],
                                                    main: FCMainResponse(temp: 97, feelsLike: 98.6, minTemp: 50, maxTemp: 100, humidity: 30),
                                                    wind: FCWindResponse(speed: 2, deg: 2),
                                                    name: "Sunnycity")
 */
