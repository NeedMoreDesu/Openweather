//
//  MapPresenter.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol MapUseCase {
    func save(forecast: Forecast)
    func allForecast() -> [Forecast]
}

protocol MapRouter {
    func toHome()
}

class MapPresenterImplementation: NSObject, MapPresenter {
    var mapUseCase: MapUseCase
    var mapRouter: MapRouter

    var title: String = "Home"
    
    init(mapUseCase: MapUseCase = MapInteractor(), mapRouter: MapRouter) {
        self.mapUseCase = mapUseCase
        self.mapRouter = mapRouter
        
//        let forecasts = self.mapUseCase.allForecast()
//        let forecastModels = HomeScreenCellModel.fromForecasts(forecasts).map { HomeScreenCellType.main(model: $0) }
//        let newCellModel = HomeScreenCellType.new
//        let cellModels = forecastModels + [newCellModel]
//        self.cellModels = cellModels
    }
    
    func handleMapClick(lat: Double, lon: Double) {
        self.mapRouter.toHome()
    }
}
