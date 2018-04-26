//
//  DetailsUseCase.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class DetailsUseCase: NSObject {
    var currentForecast: Forecast
    var currentRouter: CurrentRouter.Type
    var forecast5Router: Forecast5Router.Type
    
    init(forecast: Forecast,
         currentRouter: CurrentRouter.Type = NetworkManager.self,
         forecast5Router: Forecast5Router.Type = NetworkManager.self) {
        self.currentForecast = forecast
        self.currentRouter = currentRouter
        self.forecast5Router = forecast5Router
    }
    
    func current(completion: @escaping ((_ current: Forecast?, _ error: Error?) -> Void)) {
        self.currentRouter.current(params: [.location(lat: self.currentForecast.lat, lon: self.currentForecast.lon)], completion: completion)
    }

    func forecast5(completion: @escaping ((_ current: [Forecast]?, _ error: Error?) -> Void)) {
        self.forecast5Router.forecast5(params: [.location(lat: self.currentForecast.lat, lon: self.currentForecast.lon)], completion: completion)
    }
}
