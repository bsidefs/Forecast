//
//  FCWeatherManager.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/11/21.
//

import Foundation
import Combine
import CoreLocation

final class FCWeatherManager {
    // MARK: - Properties
    private static let apiKey = "ee1595b42c70b053187c8b47d5b09ab5"
    
    // MARK: - Methods
    func getCurrentWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) throws -> AnyPublisher<FCForecast, Error> {
        guard let apiUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&appid=\(FCWeatherManager.apiKey)&units=imperial") else {
            throw FCForecastFetchError.unableToCreateApiUrl
        }
        
        return URLSession.shared.dataTaskPublisher(for: apiUrl)
            .tryMap { data, res in
                guard let httpRes = res as? HTTPURLResponse else {
                    throw FCForecastFetchError.invalidResponse(statusCode: nil)
                }
                
                guard (200...299).contains(httpRes.statusCode) else {
                    throw FCForecastFetchError.invalidResponse(statusCode: httpRes.statusCode)
                }
                
                return data
            }
            .decode(type: FCForecast.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
