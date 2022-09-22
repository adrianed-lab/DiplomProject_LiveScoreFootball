//
//  PlayersByTeamIdTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 7.09.22.
//

import UIKit
protocol PlayersByTeamIdTableViewCellProtocol: AnyObject {
    func configureCell(photoPlayerId: Int, playerName: String, number: Int)
}

class PlayersByTeamIdTableViewCell: UITableViewCell, PlayersByTeamIdTableViewCellProtocol {
    @IBOutlet weak var playerPhoto: UIImageView!
    @IBOutlet weak var namePlayer: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    static let key = "PlayersByTeamIdTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // Сборка ячейки игроков в команде
    func configureCell(photoPlayerId: Int, playerName: String, number: Int) {
        playerPhoto.getPlayerPhoto(playerId: photoPlayerId)
        namePlayer.text = playerName
        playerNumber.text = "\(number)"
    }
    
}
