//
//  MapVC.swift
//  Openweather
//
//  Created by Oleksii Horishnii on 4/26/18.
//  Copyright © 2018 Oleksii Horishnii. All rights reserved.
//

import UIKit
import MapKit

protocol MapPresenter {
    var title: String { get }
    func handleMapClick(lat: Double, lon: Double)
}

class MapVC: UIViewController, MKMapViewDelegate {
    //MARK:- public
    public func updateUI() {
        
    }
    public class func create(router: MapRouter) -> MapVC {
        let vc = Utils.createVC(storyboardId: "Map", vcId: "MapVC") as MapVC
        vc.setup(router: router)
        return vc
    }

    //MARK:- outlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK:- private
    var presenter: MapPresenter!
    func setup(router: MapRouter) {
        self.presenter = MapPresenterImplementation(mapRouter: router)
    }
    
    //MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.presenter = HomeScreenPresenterImplementation()
//        self.title = self.presenter.title
    }
    
    //MARK:- actions
    @IBAction func mapClicked(_ sender: UITapGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.ended {
            let touchLocation = sender.location(in: mapView)
            let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
            self.presenter.handleMapClick(lat: locationCoordinate.latitude, lon: locationCoordinate.longitude)
        }
    }
}
