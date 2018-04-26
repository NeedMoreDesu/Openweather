//
//  ViewController.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.current(params: [.city(name: "Kyiv")]) { (forecast, error) in
            DatabaseManager.shared.save(forecast!)
            let forecasts = DatabaseManager.shared.allForecast()
        }
//        NetworkManager.forecast5(params: [.city(name: "Kyiv")]) { (forecasts, error) in
//
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

