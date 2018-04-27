//
//  HomeScreenPresenter.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol HomeUseCase {
    func delete(forecast: Forecast)
    func allForecast() -> [Forecast]
}

protocol HomeScreenRouter {
    func toMap()
}

protocol HomeToDetailsRouter {
    func showDetails(forecast: Forecast)
}

class HomeScreenPresenterImplementation: NSObject, HomeScreenPresenter {
    var homeUseCase: HomeUseCase
    var homeScreenRouter: HomeScreenRouter
    var toDetailsRouter: HomeToDetailsRouter

    var title: String = "Home"
    var cellModels: [HomeScreenCellType]
    var forecasts: [Forecast]
    
    init(homeUseCase: HomeUseCase = HomeInteractor(), homeScreenRouter: HomeScreenRouter, homeToDetailsRouter: HomeToDetailsRouter) {
        self.homeUseCase = homeUseCase
        self.homeScreenRouter = homeScreenRouter
        self.toDetailsRouter = homeToDetailsRouter
        self.cellModels = []
        self.forecasts = []
        super.init()
        self.updateCellModels()
    }
    
    func updateCellModels() {
        self.forecasts = self.homeUseCase.allForecast()
        let forecastModels = HomeScreenCellModel.fromForecasts(forecasts).map { HomeScreenCellType.main(model: $0) }
        let newCellModel = HomeScreenCellType.new
        let cellModels = forecastModels + [newCellModel]
        self.cellModels = cellModels
    }
    
    func handleNewButtonClick() {
        self.homeScreenRouter.toMap()
    }
    
    func forecastClickedAt(index: Int) {
        let forecast = self.forecasts[index]
        self.toDetailsRouter.showDetails(forecast: forecast)
    }
    
    func deleteItemAt(index: Int) {
        let forecast = self.forecasts[index]
        self.forecasts.remove(at: index)
        self.cellModels.remove(at: index)
        self.homeUseCase.delete(forecast: forecast)
    }
}
