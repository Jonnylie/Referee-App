//
//  TeamOneTableViewController.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit


class TeamOneTableViewController: UITableViewController {
    
    var homeTeam: [Player] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTeam = createTeam()
    }
    
    func createTeam() -> [Player] {
        var teamHomePlayers: [Player] = []
        
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


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeTeam.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = homeTeam[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: home, for: indexPath) as! PlayerCell
        cell.setHomePlayer(player: team)
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return home
    }
}
