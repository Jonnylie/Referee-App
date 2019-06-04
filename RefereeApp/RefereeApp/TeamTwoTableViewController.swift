//
//  TeamTwoTableTableViewController.swift
//  Referee
//
//  Created by Franco  Buena on 29/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit

class TeamTwoTableViewController: UITableViewController {
    
    var teamAway: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamAway = createTeam()
    }
    
    func createTeam() -> [Player] {
        
        var teamAwayPlayers: [Player] = [];
        
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamAway.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamAway[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: away, for: indexPath) as! PlayerCell
        cell.setTeamTwoPlayer(player: team)
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return away
    }
}

