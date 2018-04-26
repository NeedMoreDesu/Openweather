//
//  HomeScreenCell.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class HomeScreenCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    
    var model: HomeScreenCellModel! {
        didSet {
            self.nameLabel.text = self.model.name
            self.lonLabel.text = self.model.lon
            self.latLabel.text = self.model.lat
            self.backgroundColor = self.model.bgColor
        }
    }
}
