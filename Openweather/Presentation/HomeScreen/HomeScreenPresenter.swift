//
//  HomeScreenPresenter.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol HomeScreenView {
    func updateUI()
}

protocol HomeUseCase {
    func save(forecast: Forecast)
    func delete(forecast: Forecast)
    func allForecast() -> [Forecast]
}

class HomeScreenPresenterImplementation: NSObject, HomeScreenPresenter {
    var title: String = "Home"
    var cellModels: [HomeScreenCellType]
    var homeUseCase: HomeUseCase
    
    init(homeUseCase: HomeUseCase = HomeInteractor()) {
        self.homeUseCase = homeUseCase
        
        let forecasts = self.homeUseCase.allForecast()
        let forecastModels = HomeScreenCellModel.fromForecasts(forecasts).map { HomeScreenCellType.main(model: $0) }
        let newCellModel = HomeScreenCellType.new
        let cellModels = forecastModels + [newCellModel]
        self.cellModels = cellModels
    }
    
    func handleNewButtonClick() {
        
    }
}
