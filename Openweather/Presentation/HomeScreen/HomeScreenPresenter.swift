//
//  HomeScreenPresenter.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol HomeUseCase {
    func save(forecast: Forecast)
    func delete(forecast: Forecast)
    func allForecast() -> [Forecast]
}

protocol HomeScreenRouter {
    func toMap()
}

class HomeScreenPresenterImplementation: NSObject, HomeScreenPresenter {
    var homeUseCase: HomeUseCase
    var homeScreenRouter: HomeScreenRouter

    var title: String = "Home"
    var cellModels: [HomeScreenCellType]
    
    init(homeUseCase: HomeUseCase = HomeInteractor(), homeScreenRouter: HomeScreenRouter) {
        self.homeUseCase = homeUseCase
        self.homeScreenRouter = homeScreenRouter
        self.cellModels = []
        super.init()
        self.updateCellModels()
    }
    
    func updateCellModels() {
        let forecasts = self.homeUseCase.allForecast()
        let forecastModels = HomeScreenCellModel.fromForecasts(forecasts).map { HomeScreenCellType.main(model: $0) }
        let newCellModel = HomeScreenCellType.new
        let cellModels = forecastModels + [newCellModel]
        self.cellModels = cellModels
    }
    
    func handleNewButtonClick() {
        self.homeScreenRouter.toMap()
    }
}
