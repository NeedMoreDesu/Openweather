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
        
        let detailsWireframe = DetailsWireframe()
        let homePresenter = homePresenter ?? HomeScreenPresenterImplementation(homeScreenRouter: self, homeToDetailsRouter: detailsWireframe)
        let homeVC = homeVC ?? HomeScreenVC.create(presenter: homePresenter)
        
        let mapPresenter = mapPresenter ?? MapPresenterImplementation(mapRouter: self)
        let mapVC = mapVC ?? MapVC.create(presenter: mapPresenter)
        
        let helpVC = HelpVC.create()

        let homeNav = UINavigationController(rootViewController: homeVC)
        self.tabBar.addChildViewController(homeNav)
        detailsWireframe.nav = homeNav

        let mapNav = UINavigationController(rootViewController: mapVC)
        self.tabBar.addChildViewController(mapNav)
        
        let helpNav = UINavigationController(rootViewController: helpVC)
        self.tabBar.addChildViewController(helpNav)
        
        //preload
        mapVC.view.setNeedsLayout()
        helpVC.view.setNeedsLayout()

        AppDelegate.shared.window?.rootViewController = tabBar
    }
    
    public func toHome() {
        self.tabBar.selectedIndex = 0
    }

    public func toMap() {
        self.tabBar.selectedIndex = 1
    }
}
