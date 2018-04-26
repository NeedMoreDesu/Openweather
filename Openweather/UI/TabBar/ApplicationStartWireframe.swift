//
//  ApplicationStartWireframe.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class ApplicationStartWireframe: NSObject {
    class func showFirstScreen(tabBar: TabBar? = nil, homeVC: HomeScreenVC? = nil) {
        let tabBar = tabBar ?? TabBar.create()
        
        let homeVC = homeVC ?? HomeScreenVC.create()
        let homeNav = UINavigationController(rootViewController: homeVC)
        tabBar.addChildViewController(homeNav)
        
        AppDelegate.shared.window?.rootViewController = tabBar
    }
}
