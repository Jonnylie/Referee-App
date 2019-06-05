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
        let undo_action = undoAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [undo_action])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let yellowCard_action = yellowCardAction(at: indexPath)
        let redCard_action = redCardAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [redCard_action, yellowCard_action])
    }
    
    func yellowCardAction(at indexPath: IndexPath) -> UIContextualAction {
        let player = teamAway[indexPath.row]
        let action = UIContextualAction(style: .normal, title: yellow) { (action, view, completion) in
            player.setYellow()
            self.tableView.reloadRows(at: [indexPath], with: .none)
            completion(true)
        }
        action.backgroundColor = .yellow
        return action
    }
    
    func redCardAction(at indexPath: IndexPath) -> UIContextualAction {
        let player = teamAway[indexPath.row]
        let action = UIContextualAction(style: .normal, title: red) { (action, view, completion) in
            player.setRed()
            self.tableView.reloadRows(at: [indexPath], with: .none)
            completion(true)
        }
        action.backgroundColor = .red
        return action
    }
    
    func undoAction(at indexPath: IndexPath) -> UIContextualAction {
        let player = teamAway[indexPath.row]
        let action = UIContextualAction(style: .normal, title: undo) { (action, view, completion) in
            player.undo()
            self.tableView.reloadRows(at: [indexPath], with: .none)
            completion(true)
        }
        action.backgroundColor = .blue
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

