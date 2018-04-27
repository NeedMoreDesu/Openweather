//
//  Forecast.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class Forecast: NSObject {
    enum Units: String {
        case imperical
        case metric
    }
    
    let id: Int
    let date: Date
    let name: String
    let units: Units
    
    let temperature: Double
    let humidity: Double
    
    let windSpeed: Double
    let windDegree: Double
    
    let weatherId: Int
    let weatherMain: String
    let weatherDescription: String
    
    let lat: Double
    let lon: Double
    
    init(id: Int, date: Date, name: String, units: Units,
         temperature: Double, humidity: Double,
         windSpeed: Double, windDegree: Double,
         weatherId: Int, weatherMain: String, weatherDescription: String,
         lat: Double, lon: Double) {
        self.id = id
        self.date = date
        self.name = name
        self.units = units
        self.temperature = temperature
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windDegree = windDegree
        self.weatherId = weatherId
        self.weatherMain = weatherMain
        self.weatherDescription = weatherDescription
        self.lat = lat
        self.lon = lon
    }
}
