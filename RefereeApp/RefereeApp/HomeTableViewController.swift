//
//  TeamOneTableViewController.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit


class HomeTableViewController: UITableViewController {
    
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
        let yellow = homeTeam[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Yellow") { (action, view, completion) in
            yellow.yellowCard = !yellow.yellowCard
            completion(true)
        }
        action.backgroundColor = yellow.yellowCard ? .yellow : .gray
        return action
    }
    
    func redAction(at indexPath: IndexPath) -> UIContextualAction {
        let red = homeTeam[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Red") { (action, view, completion) in
            red.redCard = !red.redCard
            completion(true)
        }
        action.backgroundColor = red.redCard ? .red : .gray
        return action
    }
    
    func undoAction(at indexPath: IndexPath) -> UIContextualAction {
        let undo = homeTeam[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Undo") { (action, view, completion) in
            undo.redCard = !undo.redCard
            completion(true)
        }
        action.backgroundColor = undo.redCard ? .blue : .gray
        return action
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
