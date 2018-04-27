//
//  TestUtils.swift
//  OpenweatherTests
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class TestUtils: NSObject {
    class func getJson(filename: String) -> Any {
        let bundle = Bundle(for: TestUtils.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
        return json
    }
}
