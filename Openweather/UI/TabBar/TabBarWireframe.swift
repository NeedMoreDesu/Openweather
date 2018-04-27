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
    
    init(tabBar: TabBar? = nil) {
        self.tabBar = tabBar
    }
    
    public func setup(homeVC: HomeScreenVC? = nil, homePresenter: HomeScreenPresenter? = nil,
                      mapVC: MapVC? = nil, mapPresenter: MapPresenter? = nil) {
        self.tabBar = tabBar ?? TabBar.create()
        let homePresenter = homePresenter ?? HomeScreenPresenterImplementation(homeScreenRouter: self)
        let homeVC = homeVC ?? HomeScreenVC.create(presenter: homePresenter)
        let mapPresenter = mapPresenter ?? MapPresenterImplementation(mapRouter: self)
        let mapVC = mapVC ?? MapVC.create(presenter: mapPresenter)

        let homeNav = UINavigationController(rootViewController: homeVC)
        self.tabBar.addChildViewController(homeNav)

        let mapNav = UINavigationController(rootViewController: mapVC)
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
