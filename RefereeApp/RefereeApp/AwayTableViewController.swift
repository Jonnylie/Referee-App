//
//  TeamTwoTableTableViewController.swift
//  Referee
//
//  Created by Franco  Buena on 29/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit

class AwayTableViewController: UITableViewController {
    
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
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let undo = undoAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [undo])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let yellowCard = yellowAction(at: indexPath)
        let redCard = redAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [redCard, yellowCard])
    }
    
    func yellowAction(at indexPath: IndexPath) -> UIContextualAction {
        let yellow = teamAway[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Yellow") { (action, view, completion) in
            yellow.yellowCard = !yellow.yellowCard
            completion(true)
        }
        action.backgroundColor = yellow.yellowCard ? .yellow : .gray
        return action
    }
    
    func redAction(at indexPath: IndexPath) -> UIContextualAction {
        let red = teamAway[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Red") { (action, view, completion) in
            red.redCard = !red.redCard
            completion(true)
        }
        action.backgroundColor = red.redCard ? .red : .gray
        return action
    }
    
    func undoAction(at indexPath: IndexPath) -> UIContextualAction {
        let undo = teamAway[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Undo") { (action, view, completion) in
            undo.redCard = !undo.redCard
            completion(true)
        }
        action.backgroundColor = undo.redCard ? .blue : .gray
        return action
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

