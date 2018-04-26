//
//  JsonParser.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

struct JsonParser {
    let json: Any?
    
    // path method
    subscript(path: String) -> JsonParser {
        let dict = json as? [String: Any]
        let value = dict?[path]
        return JsonParser(json: value)
    }
    subscript(nth: Int) -> JsonParser {
        let arr = json as? [Any]
        let value = arr?[nth]
        return JsonParser(json: value)
    }
    // get different types
    func getString() -> String? {
        if let string = json as? String {
            return string
        }
        return nil
    }
    func getInt() -> Int? {
        if let int = json as? Int {
            return int
        }
        if let string = self.getString(),
            let int = Int(string) {
            return int
        }
        return nil
    }
    func getDouble() -> Double? {
        if let double = json as? Double {
            return double
        }
        if let string = self.getString(),
            let double = Double(string) {
            return double
        }
        if let int = self.getInt() {
            return Double(int)
        }
        return nil
    }
}
