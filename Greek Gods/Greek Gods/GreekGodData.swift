//
//  GreekGodData.swift
//  Greek Gods
//
//  Created by Iiro Alhonen on 22.12.2019.
//  Copyright © 2019 Nifty Tree Studios. All rights reserved.
//

import Foundation

class GreekGodData {
    func getAllGods() -> [GreekGod]{
        var gods: [GreekGod] = [GreekGod]()
        
        let zeus = GreekGod(_name: "Zeus", _height: 2.0, _superPower: "Lightning", _internalId: 0)
        gods.append(zeus)
        let poseidon = GreekGod(_name: "Poseidon", _height: 2.4, _superPower: "Trident", _internalId: 1)
        gods.append(poseidon)
        let demeter = GreekGod(_name: "Demeter", _height: 1.8, _superPower: "Apples and Pears", _internalId: 2)
        gods.append(demeter)
        let nike = GreekGod(_name: "Nike", _height: 1.6, _superPower: "Sports", _internalId: 3)
        gods.append(nike)
        let apollo = GreekGod(_name: "Apollo", _height: 1.9, _superPower: "Instruments", _internalId: 4)
        gods.append(apollo)
        
        return gods
    }
}
