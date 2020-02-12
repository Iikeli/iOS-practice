//
//  ViewController.swift
//  weather-practice
//
//  Created by Iiro Alhonen on 12.2.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var coordinates: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse) {
            print("Location authorized")
        } else if (status == .denied) {
            print("Authorization denied")
            let alert = UIAlertController(title: "ERROR!", message: "Allow app to access your location via settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getLocation() {
        if let location = locationManager.location {
            coordinates = location.coordinate
        }
    }

}

