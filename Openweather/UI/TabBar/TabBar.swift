//
//  TabBar.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    class func create() -> TabBar {
        return Utils.createVC(storyboardId: "Tabbar", vcId: "TabBar")
    }
}
