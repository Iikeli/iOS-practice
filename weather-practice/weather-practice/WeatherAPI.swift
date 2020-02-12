//
//  WeatherAPI.swift
//  weather-practice
//
//  Created by Iiro Alhonen on 12.2.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation

struct WeatherAPI {
    private let baseUrl = "https://api.worldweatheronline.com/premium/v1/weather.ashx"
    private let key = "&key=" // World Weather Online API key - You can get a 60 day free trial if you want to try this.
    private let day = "&date=today"
    private let format = "&format=json"
    private var coordinateString = ""
    
    init(latitude: String, longitude: String) {
        self.coordinateString = "?q=\(latitude),\(longitude)"
    }
    
    func getFullWeatherUrl () -> String {
        return baseUrl + coordinateString + key + day + format
    }
}
