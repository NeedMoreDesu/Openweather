//
//  ParsingTests.swift
//  OpenweatherTests
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import XCTest
@testable import Openweather

class ParsingCurrentTests: XCTestCase {
    func testCurrent1() {
        let json = TestUtils.getJson(filename: "current1")
        
        let current = JsonParser(json: json).parseCurrent()
        
        XCTAssertEqual(current?.date, Date(timeIntervalSince1970: 1519061700))
        XCTAssertEqual(current?.name, "Mountain View")
        XCTAssertEqual(current?.temperature, 280.44)
        XCTAssertEqual(current?.humidity, 61)
        XCTAssertEqual(current?.windSpeed, 8.2)
        XCTAssertEqual(current?.windDegree, 340)
        XCTAssertEqual(current?.weatherId, 500)
        XCTAssertEqual(current?.weatherMain, "Rain")
        XCTAssertEqual(current?.weatherDescription, "light rain")
        XCTAssertEqual(current?.lat, 37.39)
        XCTAssertEqual(current?.lon, -122.09)
    }
    
    func testCurrent2() {
        let json = TestUtils.getJson(filename: "current2")
        
        let current = JsonParser(json: json).parseCurrent()
        
        XCTAssertEqual(current?.date, Date(timeIntervalSince1970: 1485789600))
        XCTAssertEqual(current?.name, "London")
        XCTAssertEqual(current?.temperature, 280.32)
        XCTAssertEqual(current?.humidity, 81)
        XCTAssertEqual(current?.windSpeed, 4.1)
        XCTAssertEqual(current?.windDegree, 80)
        XCTAssertEqual(current?.weatherId, 300)
        XCTAssertEqual(current?.weatherMain, "Drizzle")
        XCTAssertEqual(current?.weatherDescription, "light intensity drizzle")
        XCTAssertEqual(current?.lat, 51.51)
        XCTAssertEqual(current?.lon, -0.13)
    }
}
