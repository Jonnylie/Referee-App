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


class MapPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title:String, teamHome:String, teamAway:String, location:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = home + " : " + teamHome + " " + away + " : " +  teamAway
        self.coordinate = location
    }
}
    
func getLocationName(_ location: CLLocation) -> [String] {
    var locationName: [String] = []
    CLGeocoder().reverseGeocodeLocation(location)
    { (placemark, error) in
        if error != nil {
            print ("There was an error")
        }
        else {
            if let place = placemark?[0] {
                if place.locality != nil {
                    locationName.append(place.name!)
                    locationName.append(place.locality!)
                    locationName.append(place.subLocality!)
                    locationName.append(place.country!)
                }
            }
        }
    }
    return locationName
}
