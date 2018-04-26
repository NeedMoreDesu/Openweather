//
//  ParseForecast5.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

extension JsonParser {
    func parseForecast5() -> [Forecast] {
        if let forecastJsons = self["list"].array() {
            let forecasts = forecastJsons.compactMap { (json) -> Forecast? in
                return json.parseCurrent()
            }
            return forecasts
        }
        return []
    }
}

extension NetworkManager {
    class func forecast5(params: [URLs.Params], completion: @escaping ((_ forecast5: [Forecast]?, _ error: Error?) -> Void)) {
        let urlString = URLs.formRequestString(baseRequest: URLs.forecast5, params: params)
        NetworkManager.jsonRequest(urlString: urlString, method: .GET) { (json, error) in
            guard let json = json else {
                completion(nil, error)
                return
            }
            let current = json.parseForecast5()
            completion(current, error)
        }
    }
}
