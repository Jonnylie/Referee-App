//
//  Player.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import Foundation

class Player {
    var number: String
    var name: String
    var position: String
    
    init(number: String, name: String, position: String) {
        self.number = number
        self.name = name
        self.position = position
    }
}
