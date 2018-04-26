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
        
        NetworkManager.jsonRequest(urlString: "https://api.openweathermap.org/data/2.5/weather?lat=0&lon=0&appid=c6e381d8c7ff98f0fee43775817cf6ad&units=metric", method: .GET) { (json, error) in
            let forecast = Forecast.fromJson(json!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

