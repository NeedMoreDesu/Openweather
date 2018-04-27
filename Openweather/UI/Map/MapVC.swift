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
    var forecasts: [Forecast] { get }
    func handleMapClick(lat: Double, lon: Double)
}

class MapVC: UIViewController, MKMapViewDelegate {
    //MARK:- public
    public func updateUI() {
        mapView.removeAnnotations(mapView.annotations)
        for item in self.presenter.forecasts {
            let location = CLLocationCoordinate2D(latitude: item.lat, longitude: item.lon)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            mapView.addAnnotation(annotation)
        }
    }
    public class func create(presenter: MapPresenter) -> MapVC {
        let `self` = Utils.createVC(storyboardId: "Map", vcId: "MapVC") as MapVC
        self.presenter = presenter
        return self
    }

    //MARK:- outlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK:- private
    var presenter: MapPresenter!
    
    //MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.presenter.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateUI()
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
