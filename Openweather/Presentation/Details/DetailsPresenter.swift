//
//  DetailsPresenter.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class DetailsPresenterImplementation: NSObject, DetailsPresenter {
    var detailsUseCase: DetailsUseCase

    var title: String
    var mainCellModel: DetailsCellModel
    
    init(detailsUseCase: DetailsUseCase? = nil, forecast: Forecast) {
        self.detailsUseCase = detailsUseCase ?? DetailsUseCase(forecast: forecast)
        self.title = forecast.name
        self.mainCellModel = DetailsCellModel.fromForecast(forecast)
    }
}
