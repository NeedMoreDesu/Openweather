//
//  DetailsPresenter.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

protocol DetailsView: class {
    func updateUI()
}

class DetailsPresenterImplementation: NSObject, DetailsPresenter {
    var detailsUseCase: DetailsUseCase
    weak var view: DetailsView!

    var title: String
    var mainCellModel: DetailsCellModel
    var forecastDayTitles: [String]
    var forecastsByDay: [[DetailsCellModel]]
    
    init(detailsUseCase: DetailsUseCase? = nil, forecast: Forecast) {
        self.detailsUseCase = detailsUseCase ?? DetailsUseCase(forecast: forecast)
        self.title = forecast.name
        self.mainCellModel = DetailsCellModel.fromForecast(forecast, stripTime: true)
        self.forecastDayTitles = []
        self.forecastsByDay = []
        
        super.init()
        
        self.detailsUseCase.current(completion: { (forecast, error) in
            if let forecast = forecast {
                self.mainCellModel = DetailsCellModel.fromForecast(forecast, stripTime: true)
                self.view.updateUI()
            }
        })
        self.detailsUseCase.forecast5(completion: { (forecasts, error) in
            guard let forecasts = forecasts else {
                return
            }
            if (forecasts.count == 0) {
                return
            }
            self.forecastDayTitles = []
            self.forecastsByDay = []
            var currentDay: String = forecasts.first!.date.toDay()
            var currentForecasts: [DetailsCellModel] = []
            for item in forecasts {
                if item.date.toDay() == currentDay {
                    currentForecasts.append(DetailsCellModel.fromForecast(item))
                } else {
                    self.forecastDayTitles.append(currentDay)
                    self.forecastsByDay.append(currentForecasts)
                    currentForecasts = [DetailsCellModel.fromForecast(item)]
                    currentDay = item.date.toDay()
                }
            }
            self.forecastDayTitles.append(currentDay)
            self.forecastsByDay.append(currentForecasts)
            self.view.updateUI()
        })
    }
}
