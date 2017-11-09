//
//  dataCentre.swift
//  WeatherShift
//
//  Created by Aaron Eisses on 11/9/17.
//  Copyright © 2017 Salesforce. All rights reserved.
//

import MapKit

class DataCentre: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D

    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate

        super.init()
    }

    var subtitle: String? {
        return locationName
    }
}
