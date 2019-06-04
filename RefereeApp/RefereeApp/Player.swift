//
//  Player.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import Foundation

class Player {
    var number: Int
    var yellowCard: Bool = false
    var redCard: Bool = false
    
    init(number: Int) {
        self.number = number
        self.yellowCard = false
        self.redCard = false
    }
    func setYellow()
    {
        if(yellowCard == false)
        {
            yellowCard = true
        }
        else
        {
            setRed()
        }
    }
    func setRed()
    {
        if(redCard == false)
        {
            redCard = true
            yellowCard = false
        }
    }
    func getCard() -> String
    {
        if(yellowCard == true)
        {
            return yellow
        }
        else if(redCard == true)
        {
            return red
        }
        else
        {
            return noCards
        }
    }
}
