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


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBAction func btnDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var label: UILabel!
    
    let manager = CLLocationManager()
    var customLocation: [CLLocationCoordinate2D] = []
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        
        let pin0 = pinDetail(title: "Team1 vs Team2", subTitle: "Team1: 2 yellow & 1 red, Team2: 1 yellow & 1 red", location: myLocation)
        let pin1 = pinDetail(title: "Team3 vs Team4", subTitle: "Team3: 1 yellow & 2 red, Team4: 3 yellow & 1 red",  location: customLocation[0])
        let pin2 = pinDetail(title: "Team5 vs Team6", subTitle: "Team5: 1 yellow & 1 red, Team6: 1 yellow & 1 red",  location: customLocation[1])
        let pin3 = pinDetail(title: "Team7 vs Team8", subTitle: "Team7: 1 yellow & 1 red, Team8: 2 yellow & 1 red",  location: customLocation[2])
        
        self.map.delegate = self
        self.map.showsUserLocation = true
        self.map.addAnnotation(pin0)
        self.map.addAnnotation(pin1)
        self.map.addAnnotation(pin2)
        self.map.addAnnotation(pin3)
        self.map.delegate = self
        
        
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
        customLocation = createLocation()
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
    
    func createLocation() -> [CLLocationCoordinate2D] {
        var location: [CLLocationCoordinate2D] = []
        location.append(CLLocationCoordinate2D(latitude:-33.8886, longitude:151.1873))
        location.append(CLLocationCoordinate2D(latitude:-33.9173, longitude:151.2313))
        location.append(CLLocationCoordinate2D(latitude:-33.7738, longitude:151.1126))
        return location
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







