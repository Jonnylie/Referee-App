//
//  Player.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import Foundation

class Player // Player class
{
    var number: Int
    var yellowCard: Bool
    var yellow2Card: Bool
    var redCard: Bool
    
    init(number: Int) //by default every player has no cards
    {
        self.number = number
        self.yellowCard = false
        self.yellow2Card = false
        self.redCard = false
    }
    
    func setYellow() //give yellow card to a player
    {
        if(!redCard)
        {
            if(!yellowCard)
            {
                yellowCard = true
            }
            else if(!yellow2Card)//  checks if a player got 2 yellow cards then assign a red card
            {
                yellow2Card = true
                setRed()
            }
        }
    }
    
    func setRed()
    {
        if(!redCard) // set red card if doesnot have one
        {
            redCard = true
        }
    }
    
    func getCard() -> String // gets the card a player has according to its priority
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
    
    func undo() // undo the last card assigned
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
