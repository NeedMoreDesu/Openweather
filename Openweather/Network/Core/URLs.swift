//
//  URLs.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class URLs: NSObject {
    static let baseURL = "https://api.openweathermap.org/"
    static let appID = "c6e381d8c7ff98f0fee43775817cf6ad"
    static let defaultParams = "appid=\(appID)&units=\(Forecast.Units.metric.rawValue)"
    
    // see http://openweathermap.org/current
    static let current = "\(baseURL)data/2.5/weather"
    // see http://openweathermap.org/forecast5
    static let forecast5 = "\(baseURL)data/2.5/forecast"
    
    enum Params {
        case location(lat: Double, lon: Double)
        case city(name: String)
        
        func value() -> String {
            switch self {
            case .location(let lat, let lon):
                return "lat=\(lat)&lon=\(lon)"
            case .city(let name):
                return "q=\(name)"
            }
        }
    }
    
    class func formRequestString(baseRequest: String, params: [Params]) -> String {
        let allParams = params.map { $0.value() }.joined(separator: "&")
        return "\(baseRequest)?\(allParams)&\(defaultParams)"
    }
}
