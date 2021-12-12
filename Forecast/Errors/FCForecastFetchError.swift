//
//  FCForecastFetchError.swift
//  Forecast
//
//  Created by Brian Tamsing on 12/11/21.
//

import Foundation

enum FCForecastFetchError: LocalizedError {
    case unableToCreateApiUrl
    case invalidResponse(statusCode: Int?)
    
    var errorDescription: String? {
        switch self {
            case .unableToCreateApiUrl:
                return "[!] Unable to create a URL from the OpenWeather API endpoint"
            case .invalidResponse(let statusCode):
                var desc = "[!] Invalid response code"
                
                if let statusCode = statusCode {
                    desc.append(": \(statusCode)")
                }
                
                return desc
        }
    }
}
