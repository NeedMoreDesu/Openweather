//
//  ApplicationStartWireframe.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit

class TabBarWireframe: NSObject, HomeScreenRouter, MapRouter {
    weak var tabBar: TabBar!
    weak var homeVC: HomeScreenVC!
    weak var mapVC: MapVC!
    
    init(tabBar: TabBar? = nil, homeVC: HomeScreenVC? = nil, mapVC: MapVC? = nil) {
        self.tabBar = tabBar
        self.homeVC = homeVC
        self.mapVC = mapVC
    }
    
    public func setup() {
        self.tabBar = tabBar ?? TabBar.create()
        self.homeVC = homeVC ?? HomeScreenVC.create(router: self)
        self.mapVC = mapVC ?? MapVC.create(router: self)

        let homeNav = UINavigationController(rootViewController: self.homeVC)
        self.tabBar.addChildViewController(homeNav)

        let mapNav = UINavigationController(rootViewController: self.mapVC)
        self.tabBar.addChildViewController(mapNav)

        AppDelegate.shared.window?.rootViewController = tabBar
    }
    
    public func toHome() {
        self.tabBar.selectedIndex = 0
    }

    public func toMap() {
        self.tabBar.selectedIndex = 1
    }
}
