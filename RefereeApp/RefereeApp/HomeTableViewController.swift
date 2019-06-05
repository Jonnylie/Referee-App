//
//  TeamOneTableViewController.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//
//  Table View code gathered from various YouTube iOS tutorials
//  "Swift UITableView Tutorial with Custom Cells - Beginner Series" -> Link: https://www.youtube.com/watch?v=FtO5QT2D_H8&t=401s
//  "UITableView: Swipe Actions in iOS 11 | Swift 4 | Xcode 9" -> Link: https://www.youtube.com/watch?v=wUVfE8cY2Hw

import UIKit


class HomeTableViewController: UITableViewController
{
    
    var players: [Player] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        players = getHomeTeam() //gets the player details
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {                                                                   // recognises leading swipe and shows undo button
        let undo_action = undoAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [undo_action])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {                                                                   // recognises trailing swipe and shows yellow and red buttons
        let yellowCard_action = yellowCardAction(at: indexPath)
        let redCard_action = redCardAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [redCard_action, yellowCard_action])
    }
    
    func yellowCardAction(at indexPath: IndexPath) -> UIContextualAction // updated yellow card in the table view
    {
        let player = players[indexPath.row]
        let action = UIContextualAction(style: .normal, title: yellow) { (action, view, completion) in
            player.setYellow()
            self.tableView.reloadRows(at: [indexPath], with: .none)
            completion(true)
        }
        action.backgroundColor = .yellow
        return action
    }
    
    func redCardAction(at indexPath: IndexPath) -> UIContextualAction // updated red card in the table view
    {
        let player = players[indexPath.row]
        let action = UIContextualAction(style: .normal, title: red) { (action, view, completion) in
            player.setRed()
            self.tableView.reloadRows(at: [indexPath], with: .none)
            completion(true)
        }
        action.backgroundColor = .red
        return action
    }
    
    func undoAction(at indexPath: IndexPath) -> UIContextualAction  //updated undo operation
    {
        let player = players[indexPath.row]
        let action = UIContextualAction(style: .normal, title: undo) { (action, view, completion) in
            player.undo()
            self.tableView.reloadRows(at: [indexPath], with: .none)
            completion(true)
        }
        action.backgroundColor = .blue
        return action
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let team = players[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: home, for: indexPath) as! PlayerCell
        cell.setHomePlayer(player: team)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return home
    }
}
