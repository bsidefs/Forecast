//
//  ForecastWeatherManagerTests.swift
//  ForecastTests
//
//  Created by Brian Tamsing on 12/11/21.
//

import XCTest
import CoreLocation

@testable import Forecast

class ForecastWeatherManagerTests: XCTestCase {
    // MARK: - Properties
    var sut = FCWeatherManager()

    // MARK: - Methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_getWeather_withLatitudeAndLongitude_shouldNotThrow() throws {
        let latitude: CLLocationDegrees = 37.452709
        let longtitude: CLLocationDegrees = -121.910187
        
        XCTAssertNoThrow(try sut.getCurrentWeather(latitude: latitude, longtitude: longtitude), "Valid latitude and longtitude threw an error")
    }
}
