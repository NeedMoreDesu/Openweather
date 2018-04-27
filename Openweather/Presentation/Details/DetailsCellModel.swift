//
//  DetailsCellModel.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

struct UnitSuffixes {
    static let celsiusSign = "°C"
    static let fahrenheitSign = "F"
    static let metersPerSec = "m/s"
    static let milesPerHour = "miles/h"
}

extension Forecast.Units {
    func temperatureSign() -> String {
        switch self {
        case .imperical:
            return UnitSuffixes.fahrenheitSign
        case .metric:
            return UnitSuffixes.celsiusSign
        }
    }
    
    func speedUnits() -> String {
        switch self {
        case .imperical:
            return UnitSuffixes.milesPerHour
        case .metric:
            return UnitSuffixes.metersPerSec
        }
    }
}

extension Forecast {
    func windDirection() -> String {
        let val = Int((self.windDegree/22.5)+0.5)
        let arr = ["N","NNE","NE",
                   "ENE","E","ESE",
                   "SE","SSE","S",
                   "SSW","SW","WSW",
                   "W","WNW","NW","NNW"]
        return arr[val%16]
    }
}

struct DetailsCellModel {
    let temperature: String
    let humidity: String
    let wind: String
    let time: String
    let bgImage: UIImage?
    
    static func fromForecast(_ forecast: Forecast) -> DetailsCellModel {
        let image = UIImage(named: "\(forecast.weatherId)" + ".jpg") ??
            UIImage(named: forecast.weatherDescription.lowercased() + ".jpg") ??
            UIImage(named: forecast.weatherMain.lowercased() + ".jpg")
        return DetailsCellModel(temperature: "\(forecast.temperature) \(forecast.units.temperatureSign())",
            humidity: "Humidity:\n\(forecast.humidity)%",
            wind: "Wind:\n\(forecast.windSpeed) \(forecast.units.speedUnits())\n\(forecast.windDirection())",
            time: DateFormatterManager.shared.dateToTime(forecast.date),
            bgImage: image)
    }
}
