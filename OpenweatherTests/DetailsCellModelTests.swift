//
//  DetailsCellModelTests.swift
//  OpenweatherTests
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import XCTest
@testable import Openweather

class DetailsCellModelTests: XCTestCase {
    let sampleForecast = Forecast(date: Date(), name: "tratata", units: .metric, temperature: -11, humidity: 45, windSpeed: 10.3, windDegree: 0, weatherId: 0, weatherMain: "", weatherDescription: "", lat: 123, lon: -34.44)

    func testOne() {
        let model = DetailsCellModel.fromForecast(sampleForecast)
        XCTAssertEqual(model.humidity, "Humidity:\n45.0%")
        XCTAssertEqual(model.wind, "Wind:\n10.3 \(UnitSuffixes.metersPerSec)\nN")
        XCTAssertEqual(model.temperature, "-11.0 \(UnitSuffixes.celsiusSign)")
    }
}
