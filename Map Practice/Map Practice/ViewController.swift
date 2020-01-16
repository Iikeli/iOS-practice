//
//  ViewController.swift
//  Map Practice
//
//  Created by Iiro Alhonen on 23.12.2019.
//  Copyright © 2019 Nifty Tree Studios. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let annotation = MKPointAnnotation()
    let regionRadius: Double = 10000
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        let coordinates = locationManager.location?.coordinate
        
        
        if let latitude = coordinates?.latitude {
            if let longitude = coordinates?.longitude {
                let lp = LocationPoint(latitude: String(latitude), longitude: String(longitude))
                UserDefaultDataStore().storeLocationPoint(locationPoint: lp)
                annotateLastLocation()
            }
        }
    }
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        centerMapOnUser()
        mapView.showsUserLocation = true
    }

    func centerMapOnUser() {
        guard let userCoordinates = locationManager.location?.coordinate else { return }
        let coordinateRegion = MKCoordinateRegion(center: userCoordinates, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func annotateLastLocation() {
        if let savedCoordinate = UserDefaultDataStore().getLastLocation() {
            annotation.coordinate.latitude = Double(savedCoordinate.latitude)!
            annotation.coordinate.longitude = Double(savedCoordinate.longitude)!
            annotation.title = "Was here!"
            annotation.subtitle = "Remember?"
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("location not enabled")
            return
        }
        print("location enabled")
        mapView.showsUserLocation = true
    }

}

