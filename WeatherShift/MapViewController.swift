//
//  MapViewController.swift
//  WeatherShift
//
//  Created by Aaron Eisses on 11/9/17.
//  Copyright © 2017 Salesforce. All rights reserved.
//

import Foundation
import UIKit
import MapKit

// Amherst 45.9167 64.2167
// Annapolis 44.7422 65.5158
// Annapolis Valley 44.9167 65.1667
// Cape Breton West 46.2487 60.8518
// Guysborough 44.8780 59.8066
// HRM 44.6488 63.5752
// Kentville 45.0769 64.4945
// Liverpool 44.0330 64.7177

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!

    let initialLocation = CLLocation(latitude: 44.7, longitude: -62.90)
    
    let amherstLocation = CLLocationCoordinate2D(latitude: 45.9167, longitude: -64.2167)
    let annapolistLocation = CLLocationCoordinate2D(latitude: 44.7422, longitude: -65.5158)
    let annapolisValleyLocation = CLLocationCoordinate2D(latitude: 44.9167, longitude: -64.2167)
    let capeBretonWestLocation = CLLocationCoordinate2D(latitude: 46.2487, longitude: -60.8518)
    let guysboroghLocation = CLLocationCoordinate2D(latitude: 44.8780, longitude: -59.8066)
    let hrmLocation = CLLocationCoordinate2D(latitude: 44.6488, longitude: -63.5752)
    let kentvilleLocation = CLLocationCoordinate2D(latitude: 45.0769, longitude: -64.4945)
    let liverpoolLocation = CLLocationCoordinate2D(latitude: 44.0330, longitude: -64.7177)

    let regionRadius: CLLocationDistance = 200000

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        mapView.mapType = .hybrid
        centreMapOnLocation(location: initialLocation)

        let dataCenter = DataCentre(title: "HRM", locationName: "", discipline: "", coordinate: hrmLocation);
        mapView.addAnnotation(dataCenter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func centreMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(mapView.region)
    }

}
