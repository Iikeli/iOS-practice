//
//  GreekGod.swift
//  Greek Gods
//
//  Created by Iiro Alhonen on 22.12.2019.
//  Copyright © 2019 Nifty Tree Studios. All rights reserved.
//

import Foundation

class GreekGod {
    var name : String
    var height : Double
    var superPower : String
    var internalId : Int
    
    init(_name: String, _height: Double, _superPower: String, _internalId: Int) {
        name = _name
        height = _height
        superPower = _superPower
        internalId = _internalId
    }
}
