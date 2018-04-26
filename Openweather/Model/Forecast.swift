//
//  Forecast.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class Forecast: NSObject {
    let id: Int
    let date: Date
    let name: String
    
    let temperature: Double
    let humidity: Double
    
    let windSpeed: Double
    let windDegree: Double
    
    let weatherId: Int
    let weatherDescription: String
    
    let lat: Double
    let lon: Double
    
    init(id: Int, date: Date, name: String,
         temperature: Double, humidity: Double,
         windSpeed: Double, windDegree: Double,
         weatherId: Int, weatherDescription: String,
         lat: Double, lon: Double) {
        self.id = id
        self.date = date
        self.name = name
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
