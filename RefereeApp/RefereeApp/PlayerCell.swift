//
//  PlayerCell.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var teamOneNumber: UILabel!
    @IBOutlet weak var teamOneCard: UILabel!
    
    @IBOutlet weak var teamTwoNumber: UILabel!
    @IBOutlet weak var teamTwoCard: UILabel!
    
    
    func setTeamOnePlayer(player: Player) {
        teamOneNumber.text = player.number
        teamOneCard.text = player.position
    }
    
    func setTeamTwoPlayer(player: Player) {
        teamTwoNumber.text = player.number
        teamTwoCard.text = player.position
    }
}
