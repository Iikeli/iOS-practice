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
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        let coordinates = locationManager.location?.coordinate
        
        if let latitude = coordinates?.latitude {
            print("Latitude: " + String(latitude))
        }
        
        if let longitude = coordinates?.longitude {
            print("Longitude: " + String(longitude))
        }
    }
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
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

