//
//  HardcodedData.swift
//  RefereeApp
//
//  Created by WOLF on 5/6/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import Foundation

var teamHomePlayers: [Player] = []
var teamAwayPlayers: [Player] = [];

func getHomeTeam() -> [Player] {
    
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

func getAwayTeam() -> [Player] {
    
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



