//
//  UserDefaultDataStore.swift
//  Map Practice
//
//  Created by Iiro Alhonen on 16.1.2020.
//  Copyright © 2020 Nifty Tree Studios. All rights reserved.
//

import Foundation

struct StorageKeys {
    static let storedLatitude = "latitude"
    static let storedLongitude = "longitude"
}

class UserDefaultDataStore {
    func getDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    func getLastLocation() -> LocationPoint? {
        let defaults = getDefaults()
        if let latitude = defaults.string(forKey: StorageKeys.storedLatitude) {
            if let longitude = defaults.string(forKey: StorageKeys.storedLongitude) {
                return LocationPoint(latitude: latitude, longitude: longitude)
            }
        }
        return nil
    }
    
    func storeLocationPoint(locationPoint: LocationPoint) {
        let defaults = getDefaults()
        defaults.setValue(locationPoint.latitude, forKey: StorageKeys.storedLatitude)
        defaults.setValue(locationPoint.longitude, forKey: StorageKeys.storedLongitude)
        defaults.synchronize()
    }
}
