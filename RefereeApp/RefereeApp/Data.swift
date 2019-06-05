//
//  HardcodedData.swift
//  RefereeApp
//
//  Created by WOLF on 5/6/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import Foundation
import CoreLocation


var teamHomePlayers: [Player] = []
var teamAwayPlayers: [Player] = []
var myPin: MapPin?

func getHomeTeam() -> [Player]
{
    
    teamHomePlayers.append(Player(number: 13))
    teamHomePlayers.append(Player(number: 66))
    teamHomePlayers.append(Player(number: 32))
    teamHomePlayers.append(Player(number: 4))
    teamHomePlayers.append(Player(number: 26))
    teamHomePlayers.append(Player(number: 14))
    teamHomePlayers.append(Player(number: 3))
    teamHomePlayers.append(Player(number: 7))
    teamHomePlayers.append(Player(number: 23))
    teamHomePlayers.append(Player(number: 27))
    teamHomePlayers.append(Player(number: 10))
    
    return teamHomePlayers
}

func getAwayTeam() -> [Player]
{
    
    teamAwayPlayers.append(Player(number: 1))
    teamAwayPlayers.append(Player(number: 2))
    teamAwayPlayers.append(Player(number: 3))
    teamAwayPlayers.append(Player(number: 5))
    teamAwayPlayers.append(Player(number: 3))
    teamAwayPlayers.append(Player(number: 12))
    teamAwayPlayers.append(Player(number: 17))
    teamAwayPlayers.append(Player(number: 7))
    teamAwayPlayers.append(Player(number: 20))
    teamAwayPlayers.append(Player(number: 23))
    teamAwayPlayers.append(Player(number: 27))
    
    return teamAwayPlayers
}

func getNumberOfYellowCards(_ team: String) -> Int
{
    var cards: Int = 0
    switch team
    {
        case home:
            for player in teamHomePlayers
            {
                if(player.getCard() == yellow)
                {
                    cards += 1
                }
            }
        case away:
        
                for player in teamAwayPlayers
                {
                    if(player.getCard() == yellow)
                    {
                        cards += 1
                    }
                }
        default:
            return -1
    }
    return cards
}

func getNumberOfRedCards(_ team: String) -> Int
{
    var cards: Int = 0
    switch team
    {
        case home:
            for player in teamHomePlayers
            {
                if(player.getCard() == red)
                {
                    cards += 1
                }
            }
        case away:
            for player in teamAwayPlayers
            {
                if(player.getCard() == red)
                {
                    cards += 1
                }
            }
        default:
            return -1
    }
    return cards
}

func getCardsOfHome() -> String
{
    return "\(getNumberOfYellowCards(home)) \(yellow) \(getNumberOfRedCards(home)) \(red)"
}

func getCardsOfAway() -> String
{
    return "\(getNumberOfYellowCards(away)) \(yellow) \(getNumberOfRedCards(away)) \(red)"
}

func getPins() -> [MapPin]
{
    var pins: [MapPin] = []
    
    pins.append(MapPin(title: home + " vs " + away, teamHome: "5 yellow, 2 red", teamAway: "2 yellow, 1 red",  location: CLLocationCoordinate2D(latitude:-33.8886, longitude:151.1873)))
        
    pins.append(MapPin(title: home + " vs " + away, teamHome: "4 yellow, 5 red", teamAway: "1 yellow, 0 red",  location: CLLocationCoordinate2D(latitude:-33.9173, longitude:151.2313)))
        
    pins.append(MapPin(title: home + " vs " + away, teamHome: "3 yellow, 0 red", teamAway: "3 yellow, 5 red",  location: CLLocationCoordinate2D(latitude:-33.7738, longitude:151.1126)))
    
    return pins
}
