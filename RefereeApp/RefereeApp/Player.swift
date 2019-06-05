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
    var yellowCard: Bool
    var yellow2Card: Bool
    var redCard: Bool
    
    init(number: Int) {
        self.number = number
        self.yellowCard = false
        self.yellow2Card = false
        self.redCard = false
    }
    func setYellow()
    {
        if(!redCard)
        {
            if(!yellowCard)
            {
                yellowCard = true
            }
            else if(!yellow2Card)
            {
                yellow2Card = true
                setRed()
            }
        }
    }
    func setRed()
    {
        if(!redCard)
        {
            redCard = true
        }
    }
    func getCard() -> String
    {
        if(yellowCard && !yellow2Card)
        {
            return yellow
        }
        else if(redCard)
        {
            return red
        }
        else
        {
            return noCards
        }
    }
    func undo()
    {
        
        if(yellow2Card)
        {
            yellow2Card = false
            redCard = false
        }
        else if(yellowCard)
        {
            yellowCard = false
        }
        else if(redCard)
        {
            redCard = false
        }
    }
}
