//
//  PinDetail.swift
//  RefereeApp
//
//  Created by Erawati Tjahjadi on 04/06/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation


class pinDetail: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title:String, subTitle:String, location:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subTitle
        self.coordinate = location
    }
}
