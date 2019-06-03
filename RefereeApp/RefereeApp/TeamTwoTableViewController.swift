//
//  TeamTwoTableTableViewController.swift
//  Referee
//
//  Created by Franco  Buena on 29/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit

class TeamTwoTableViewController: UITableViewController {
    
    var teamTwo: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamTwo = createTeam()
    }
    
    func createTeam() -> [Player] {
        
        var teamTwoPlayers: [Player] = [];
        
        teamTwoPlayers.append(Player(number: "1", name: "Lloris", position: "GK"))
        teamTwoPlayers.append(Player(number: "2", name: "Trippier", position: "RB"))
        teamTwoPlayers.append(Player(number: "4", name: "Alderweireld", position: "CB"))
        teamTwoPlayers.append(Player(number: "5", name: "Vertonghen", position: "CB"))
        teamTwoPlayers.append(Player(number: "3", name: "Rose", position: "LB"))
        teamTwoPlayers.append(Player(number: "12", name: "Wanyama", position: "CM"))
        teamTwoPlayers.append(Player(number: "17", name: "Sissoko", position: "CM"))
        teamTwoPlayers.append(Player(number: "7", name: "Son", position: "LW"))
        teamTwoPlayers.append(Player(number: "20", name: "Alli", position: "CAM"))
        teamTwoPlayers.append(Player(number: "23", name: "Eriksen", position: "RW"))
        teamTwoPlayers.append(Player(number: "27", name: "Moura", position: "ST"))
        
        return teamTwoPlayers
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamTwo.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamTwo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamTwo", for: indexPath) as! PlayerCell
        cell.setTeamTwoPlayer(player: team)
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "Player"
    }
}

