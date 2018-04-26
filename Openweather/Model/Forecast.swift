//
//  Forecast.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class Forecast: NSObject {
    let date: Date
    
    let temperature: Double
    let humidity: Double
    
    let windSpeed: Double
    let windDegree: Double
    
    let weatherId: Int
    let weatherDescription: String
    
    let lat: Double
    let lon: Double
    
    init(date: Date,
         temperature: Double, humidity: Double,
         windSpeed: Double, windDegree: Double,
         weatherId: Int, weatherDescription: String,
         lat: Double, lon: Double) {
        self.date = date
        self.temperature = temperature
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windDegree = windDegree
        self.weatherId = weatherId
        self.weatherDescription = weatherDescription
        self.lat = lat
        self.lon = lon
    }
}
