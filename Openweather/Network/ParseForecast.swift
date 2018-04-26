//
//  ParseForecast.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

extension Forecast {
    class func fromJson(_ json: JsonParser) -> Forecast? {
        if let temperature = json["main"]["temp"].getDouble(),
            let humidity = json["main"]["humidity"].getDouble(),
            let windSpeed = json["wind"]["speed"].getDouble(),
            let windDegree = json["wind"]["deg"].getDouble(),
            let weatherId = json["weather"][0]["id"].getInt(),
            let weatherDescription = json["weather"][0]["description"].getString() {
            return Forecast(temperature: temperature, humidity: humidity,
                     windSpeed: windSpeed, windDegree: windDegree,
                     weatherId: weatherId, weatherDescription: weatherDescription)
        }
        return nil
    }
}
