//
//  PlayerCell.swift
//  Referee
//
//  Created by Kenichi Franco Buena on 28/5/19.
//  Copyright © 2019 Franco Buena. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var teamHomeNumber: UILabel!
    @IBOutlet weak var teamHomeCard: UILabel!
    
    @IBOutlet weak var teamAwayNumber: UILabel!
    @IBOutlet weak var teamAwayCard: UILabel!
    
    
    func setHomePlayer(player: Player) {
        teamHomeNumber.text = String(player.number)
        teamHomeCard.text = player.getCard()
    }
    
    func setTeamTwoPlayer(player: Player) {
        teamAwayNumber.text = String(player.number)
        teamAwayCard.text = player.getCard()
        
    }
}
