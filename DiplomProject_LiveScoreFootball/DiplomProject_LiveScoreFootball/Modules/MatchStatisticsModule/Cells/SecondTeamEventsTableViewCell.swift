//
//  SecondTeamEventsTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 4.09.22.
//

import UIKit

protocol SecondTeamEventsTableViewCellProtocol {
    func configureCell(playerName: String, assistentPlayerName: String, typeEvent: String, detailTypeEvent: String, timeEvent: Int)
}

class SecondTeamEventsTableViewCell: UITableViewCell, SecondTeamEventsTableViewCellProtocol {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var namePlayer: UILabel!
    @IBOutlet weak var nameAssistPlayer: UILabel!
    @IBOutlet weak var typeDetail: UILabel!
    
    static let key = "SecondTeamEventsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    // Метод сборки ячейки с событиями второй команды
    func configureCell(playerName: String, assistentPlayerName: String, typeEvent: String, detailTypeEvent: String, timeEvent: Int) {
        namePlayer.text = playerName
        nameAssistPlayer.text = assistentPlayerName
        time.text = "\(timeEvent)'"
        type.text = typeEvent
        typeDetail.text = detailTypeEvent
    }
    
}
