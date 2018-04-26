//
//  HomeScreenCellModel.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

enum HomeScreenCellType {
    case main(model: HomeScreenCellModel)
    case new
}

struct HomeScreenCellModel {
    static let colorCycle = [UIColor(red: 1.0, green: 0.9, blue: 0.9, alpha: 1.0),
                             UIColor(red: 0.9, green: 1.0, blue: 0.9, alpha: 1.0),
                             UIColor(red: 0.9, green: 0.9, blue: 1.0, alpha: 1.0)]
    
    let name: String
    let lat: String
    let lon: String
    let bgColor: UIColor
    
    static func fromForecasts(_ forecasts: [Forecast]) -> [HomeScreenCellModel] {
        return forecasts.enumerated().map { (idx, item) -> HomeScreenCellModel in
            return HomeScreenCellModel(
                name: item.name,
                lat: "Lat: \(item.lat)",
                lon: "Lon: \(item.lon)",
                bgColor: colorCycle[idx%colorCycle.count])
        }
    }
}
