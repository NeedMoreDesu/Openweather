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
    static let defaultParams = "appid=\(appID)&units=metric"

    // see http://openweathermap.org/current
    static let current = "\(baseURL)data/2.5/weather"
    class func current(lat: Double, lon: Double) -> String {
        let params = "lat=\(lat)&lon=\(lon)"
        let fullURL = "\(self.current)?\(params)&\(defaultParams)"
        return fullURL
    }
    class func current(city: String) -> String {
        let params = "q=\(city)"
        let fullURL = "\(self.current)?\(params)&\(defaultParams)"
        return fullURL
    }

    // see http://openweathermap.org/forecast5
    static let forecast5 = "\(baseURL)data/2.5/forecast"
    
}
