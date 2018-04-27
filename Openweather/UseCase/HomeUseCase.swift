//
//  HomeInteractor.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class HomeInteractor: NSObject, HomeUseCase {
    var forecastRepository: ForecastRepository
    
    init(forecastRepository: ForecastRepository = DatabaseManager.shared) {
        self.forecastRepository = forecastRepository
    }
    
    func save(forecast: Forecast) {
        self.forecastRepository.save(forecast)
    }

    func delete(forecast: Forecast) {
        self.forecastRepository.delete(forecast)
    }

    func allForecast() -> [Forecast] {
        return self.forecastRepository.allForecast()
    }
}
