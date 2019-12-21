//
//  Utilities.swift
//  back-to-the-future
//
//  Created by Iiro Alhonen on 20.12.2019.
//  Copyright © 2019 Nifty Tree Studios. All rights reserved.
//

import Foundation

class Utilities {
    func getDate () -> Date {
        return Date()
    }

    func getCurrentDate () -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        let dateString = formatter.string(from: getDate())
        return dateString
    }
    
    func getCurrentTime () -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        
        let timeString = formatter.string(from: getDate())
        return timeString
    }
    
    func getCurrentYear () -> String {
        let calendar = Calendar.current
        return String(calendar.component(.year, from: getDate()))
    }
    
    func getLetterAtIndex(str: String, location: Int) -> String {
        let index = str.index(str.startIndex, offsetBy: location)
        return String(str[index])
    }
    
    func getRandomYear () -> String {
        return String(arc4random_uniform(8999) + 1000)
    }
}
