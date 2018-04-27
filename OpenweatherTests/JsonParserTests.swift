//
//  JsonParserTests.swift
//  OpenweatherTests
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import XCTest
@testable import Openweather

class JsonParserTests: XCTestCase {
    var jsonRaw = [
        "first" : "123",
        "second" : [
            1,
            2.3,
            "2.3",
            "asdf",
            "444"
        ],
        "third" : [
            "a" : "b"
        ]
        ] as [String : Any]
    
    func testPath() {
        let json = JsonParser(json: jsonRaw)
        XCTAssertEqual(json["first"].json as? String, "123")
    }
    func testArrayPath() {
        let json = JsonParser(json: jsonRaw)
        XCTAssertEqual(json["second"][2].json as? String, "2.3")
    }
    func testGetString() {
        let json = JsonParser(json: jsonRaw)
        XCTAssertEqual(json["second"][0].getString(), nil)
        XCTAssertEqual(json["second"][1].getString(), nil)
        XCTAssertEqual(json["second"][2].getString(), "2.3")
        XCTAssertEqual(json["second"][3].getString(), "asdf")
        XCTAssertEqual(json["second"][4].getString(), "444")
    }
    func testGetInt() {
        let json = JsonParser(json: jsonRaw)
        XCTAssertEqual(json["second"][0].getInt(), 1)
        XCTAssertEqual(json["second"][1].getInt(), nil)
        XCTAssertEqual(json["second"][2].getInt(), nil)
        XCTAssertEqual(json["second"][3].getInt(), nil)
        XCTAssertEqual(json["second"][4].getInt(), 444)
    }
    func testGetDouble() {
        let json = JsonParser(json: jsonRaw)
        XCTAssertEqual(json["second"][0].getDouble(), 1)
        XCTAssertEqual(json["second"][1].getDouble(), 2.3)
        XCTAssertEqual(json["second"][2].getDouble(), 2.3)
        XCTAssertEqual(json["second"][3].getDouble(), nil)
        XCTAssertEqual(json["second"][4].getDouble(), 444)
    }
}
