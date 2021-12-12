//
//  ForecastFCHomeViewModelTests.swift
//  ForecastTests
//
//  Created by Brian Tamsing on 12/11/21.
//

import XCTest
import CoreLocation

@testable import Forecast

class ForecastFCHomeViewModelTests: XCTestCase {
    
    // MARK: - Properties
    var sut = FCHomeViewModel(weatherManager: FCWeatherManager())
    
    // MARK: - Methods
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_getWeather_withLatitudeAndLongtitude_shouldProduceFCForecastInReasonableTime() throws {
        let latitude: CLLocationDegrees = 37.452709
        let longtitude: CLLocationDegrees = -121.910187
        
        let expectation = XCTestExpectation(description: "Should fetch current weather")
        
        sut.getCurrentWeather(latitude: latitude, longtitude: longtitude)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [unowned self] in
            XCTAssertNotNil(self.sut.forecast, "Forecast object was nil")
            expectation.fulfill()
        }
    }
}
