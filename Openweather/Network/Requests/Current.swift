//
//  ParseForecast.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

extension JsonParser {
    func parseCurrent() -> Forecast? {
        if let dateUTC = self["dt"].getInt(),
            let temperature = self["main"]["temp"].getDouble(),
            let humidity = self["main"]["humidity"].getDouble(),
            let windSpeed = self["wind"]["speed"].getDouble(),
            let windDegree = self["wind"]["deg"].getDouble(),
            let weatherId = self["weather"][0]["id"].getInt(),
            let weatherDescription = self["weather"][0]["description"].getString() {
            let date = Date(timeIntervalSince1970: TimeInterval(dateUTC))
            return Forecast(date: date, temperature: temperature, humidity: humidity,
                     windSpeed: windSpeed, windDegree: windDegree,
                     weatherId: weatherId, weatherDescription: weatherDescription)
        }
        return nil
    }
}

extension NetworkManager {
    class func current(params: [URLs.Params], completion: @escaping ((_ current: Forecast?, _ error: Error?) -> Void)) {
        let urlString = URLs.formRequestString(baseRequest: URLs.current, params: params)
        NetworkManager.jsonRequest(urlString: urlString, method: .GET) { (json, error) in
            guard let json = json else {
                completion(nil, error)
                return
            }
            let current = json.parseCurrent()
            completion(current, error)
        }
    }
}
