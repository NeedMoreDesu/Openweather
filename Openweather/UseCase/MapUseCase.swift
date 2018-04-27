//
//  HomeInteractor.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class MapInteractor: NSObject, MapUseCase {
    var forecastRepository: ForecastRepository
    var currentRouter: CurrentRouter.Type
    
    init(forecastRepository: ForecastRepository = DatabaseManager.shared,
         currentRouter: CurrentRouter.Type = NetworkManager.self) {
        self.forecastRepository = forecastRepository
        self.currentRouter = currentRouter
    }

    func newLocation(lat: Double, lon: Double, callback: @escaping (() -> Void)) {
        self.currentRouter.current(params: [.location(lat: lat, lon: lon)]) { (forecast, error) in
            if let forecast = forecast {
                self.forecastRepository.save(forecast)
            }
            callback()
        }
    }

    func allForecast() -> [Forecast] {
        return self.forecastRepository.allForecast()
    }
}
