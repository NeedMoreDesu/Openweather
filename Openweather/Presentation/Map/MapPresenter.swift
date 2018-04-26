//
//  MapPresenter.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol MapUseCase {
    func allForecast() -> [Forecast]
    func newLocation(lat: Double, lon: Double, callback: @escaping (() -> Void))
}

protocol MapRouter {
    func toHome()
}

class MapPresenterImplementation: NSObject, MapPresenter {
    var mapUseCase: MapUseCase
    var mapRouter: MapRouter
    var forecasts: [Forecast] {
        return self.mapUseCase.allForecast()
    }

    var title: String = "Map"
    
    init(mapUseCase: MapUseCase = MapInteractor(), mapRouter: MapRouter) {
        self.mapUseCase = mapUseCase
        self.mapRouter = mapRouter
    }
    
    func handleMapClick(lat: Double, lon: Double) {
        self.mapUseCase.newLocation(lat: lat, lon: lon) {
            self.mapRouter.toHome()
        }
    }
}
