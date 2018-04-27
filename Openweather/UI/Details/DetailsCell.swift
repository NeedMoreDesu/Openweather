//
//  DetailsCell.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/27/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class DetailsCell: UICollectionViewCell {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var model: DetailsCellModel! {
        didSet {
            self.temperatureLabel.text = self.model.temperature
            self.humidityLabel.text = self.model.humidity
            self.windLabel.text = self.model.wind
            self.bgImage.image = self.model.bgImage
            self.timeLabel.text = self.model.time
        }
    }
}
