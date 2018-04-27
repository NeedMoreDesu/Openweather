//
//  Requirements.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol ForecastRepository {
    func save(_ forecast: Forecast)
    func delete(_ forecast: Forecast)
    func allForecast() -> [Forecast]
}

protocol CurrentRouter {
    static func current(params: [URLs.Params], completion: @escaping ((_ current: Forecast?, _ error: Error?) -> Void))
}

protocol Forecast5Router {
    static func forecast5(params: [URLs.Params], completion: @escaping ((_ forecast5: [Forecast]?, _ error: Error?) -> Void), basedOn: Forecast?)
}

