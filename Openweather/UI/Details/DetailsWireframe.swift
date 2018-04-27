//
//  DetailsWireframe.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class DetailsWireframe: NSObject, HomeToDetailsRouter {
    public var nav: UINavigationController!
    
    func showDetails(forecast: Forecast) {
        let detailsPresenter = DetailsPresenterImplementation(forecast: forecast)
        let detailsVC = DetailsVC.create(presenter: detailsPresenter)
        self.nav.pushViewController(detailsVC, animated: true)
    }
    
    func hideDetails() {
        self.nav.popViewController(animated: true)
    }
}
