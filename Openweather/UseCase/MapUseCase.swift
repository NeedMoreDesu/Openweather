//
//  HomeInteractor.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class MapInteractor: NSObject, MapUseCase {
    var timestampRouter: ForecastRepository
    
    init(timestampRouter: ForecastRepository = DatabaseManager.shared) {
        self.timestampRouter = timestampRouter
    }

    func save(forecast: Forecast) {
        self.timestampRouter.save(forecast)
    }

    func allForecast() -> [Forecast] {
        return self.timestampRouter.allForecast()
    }
}
