//
//  FCForecast.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/11/21.
//

import Foundation

struct FCForecast: Decodable {
    let weather : [FCWeatherResponse]
    let main    : FCMainResponse
    let wind    : FCWindResponse
    let name    : String
}

struct FCWeatherResponse: Decodable {
    let status      : String
    let description : String
    
    private enum CodingKeys: String, CodingKey {
        case status = "main"
        case description
    }
}

struct FCMainResponse: Decodable {
    let temp        : Double
    let feelsLike   : Double
    let minTemp     : Double
    let maxTemp     : Double
    let humidity    : Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike  = "feels_like"
        case minTemp    = "temp_min"
        case maxTemp    = "temp_max"
        case humidity
    }
}

struct FCWindResponse: Decodable {
    let speed   : Double
    let deg     : Double
}
