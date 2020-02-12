//
//  ViewController.swift
//  weather-practice
//
//  Created by Iiro Alhonen on 12.2.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var coordinates: CLLocationCoordinate2D?
    var temperature = 0

    @IBOutlet weak var TemperatureLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse) {
            print("lol")
            getLocation()
        } else if (status == .denied) {
            let alert = UIAlertController(title: "ERROR!", message: "Allow app to access your location via settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getLocation() {
        if let location = locationManager.location {
            coordinates = location.coordinate
            getWeatherData()
        }
    }
    
    func getWeatherData() {
        if (coordinates != nil) {
            let fullUrl = WeatherAPI(latitude: String(coordinates!.latitude), longitude: String(coordinates!.longitude)).getFullWeatherUrl()
            AF.request(fullUrl).responseJSON { response in
                if let JSON = response.value {
                    // print("JSON: \(JSON)")
                    self.getTemperature(json: JSON)
                }
            }
        }
    }
    
    func getTemperature(json: Any) {
        if let data = json as? Dictionary<String, AnyObject> {
            if let basicData = data["data"] as? Dictionary<String, AnyObject> {
                if let weatherData = basicData["weather"] as? [Dictionary<String, AnyObject>] {
                    if let currentTemp = weatherData[0] as? Dictionary<String, AnyObject> {
                        print(currentTemp)
                    }
                }
            }
        }
    }

}

