//
//  TeamOneTableViewController.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit


class TeamOneTableViewController: UITableViewController {
    
    var teamOne: [Player] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamOne = createTeam()
    }
    
    func createTeam() -> [Player] {
        var teamOnePlayers: [Player] = []
        
        teamOnePlayers.append(Player(number: "13", name: "Alisson", position: "GK"))
        teamOnePlayers.append(Player(number: "66", name: "Alexander-Arnold", position: "RB"))
        teamOnePlayers.append(Player(number: "32", name: "Matip", position: "CB"))
        teamOnePlayers.append(Player(number: "4", name: "Van Dyke", position: "CB"))
        teamOnePlayers.append(Player(number: "26", name: "Robertson", position: "LB"))
        teamOnePlayers.append(Player(number: "14", name: "Henderson", position: "MF"))
        teamOnePlayers.append(Player(number: "3", name: "Fabinho", position: "CM"))
        teamOnePlayers.append(Player(number: "7", name: "Milner", position: "MF"))
        teamOnePlayers.append(Player(number: "23", name: "Shaqiri", position: "RW"))
        teamOnePlayers.append(Player(number: "27", name: "Origi", position: "ST"))
        teamOnePlayers.append(Player(number: "10", name: "Mane", position: "LW"))
        
        return teamOnePlayers
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamOne.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamOne[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamOne", for: indexPath) as! PlayerCell
        cell.setTeamOnePlayer(player: team)
        return cell
    }
}
