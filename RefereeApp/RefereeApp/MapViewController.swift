//
//  MapViewController.swift
//  Referee
//
//  Created by Erawati Tjahjadi on 02/06/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var label: UILabel!
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //current location
        let location = locations[0]
        //custom location
        let location2 = CLLocationCoordinate2D(latitude:-33.8886, longitude:151.1873)
        let location3 = CLLocationCoordinate2D(latitude:-33.9173, longitude:151.2313)
        let location4 = CLLocationCoordinate2D(latitude:-33.7738, longitude:151.1126)
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        
        //custom pin description
        let pin = customPin(pinTitle: "Match is happening", pinSubTitle: "Team 1 vs Team 2", location: myLocation)
        let pin2 = customPin(pinTitle: "USYD", pinSubTitle: "Team 3 vs Team 4", location: location2)
        let pin3 = customPin(pinTitle: "UNSW", pinSubTitle: "Team 5 vs Team 6", location: location3)
        let pin4 = customPin(pinTitle: "Macquarie", pinSubTitle: "Team 7 vs Team 8", location: location4)
        
        self.map.addAnnotation(pin)
        self.map.addAnnotation(pin2)
        self.map.addAnnotation(pin3)
        self.map.addAnnotation(pin4)
        self.map.delegate = self
        self.map.showsUserLocation = true
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil {
                print ("There was an error")
            }
            else {
                if let place = placemark?[0] {
                    if place.locality != nil {
                        self.label.text = "\(place.locality!) \n \(place.subLocality!) \n \(place.country!)"
                    }
                }
            }
        }
    }
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.stopUpdatingLocation()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customanotation")
        annotationView.image = UIImage(named:"pin")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    
}






