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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        
        let pins = getPins()
        
        self.map.delegate = self
        self.map.showsUserLocation = true
        for pin in pins
        {
            self.map.addAnnotation(pin)
        }
        myPin = MapPin(title: home + " vs " + away, teamHome: getCardsOfHome(), teamAway: getCardsOfAway(), location: myLocation )
        self.map.addAnnotation(myPin!)
        self.map.delegate = self
        
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil {
                print ("There was an error")
            }
            else {
                if let place = placemark?[0] {
                    if place.locality != nil {
                        self.label.text = "\(place.locality!), \(place.subLocality!) \n \(place.country!)"
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
