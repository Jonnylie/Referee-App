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
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamOnePosition: UILabel!
    
    @IBOutlet weak var teamTwoNumber: UILabel!
    @IBOutlet weak var teamTwoName: UILabel!
    @IBOutlet weak var teamTwoPosition: UILabel!
    
    
    func setTeamOnePlayer(player: Player) {
        teamOneNumber.text = player.number
        teamOneName.text = player.name
        teamOnePosition.text = player.position
    }
    
    func setTeamTwoPlayer(player: Player) {
        teamTwoNumber.text = player.number
        teamTwoName.text = player.name
        teamTwoPosition.text = player.position
    }
}
