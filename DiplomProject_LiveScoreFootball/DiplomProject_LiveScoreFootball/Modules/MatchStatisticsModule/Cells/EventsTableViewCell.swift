//
//  EventsTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import UIKit

protocol EventsTableViewCellProtocol: AnyObject {
    
    func configureCell(playerName: String, assistentPlayerName: String, typeEvent: String, detailTypeEvent: String, timeEvent: Int)
}

class EventsTableViewCell: UITableViewCell, EventsTableViewCellProtocol {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var namePlayer: UILabel!
    @IBOutlet weak var nameAssistPlayer: UILabel!
    @IBOutlet weak var typeDetail: UILabel!
    
    static let key = "EventsTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(playerName: String, assistentPlayerName: String, typeEvent: String, detailTypeEvent: String, timeEvent: Int) {
        namePlayer.text = playerName
        nameAssistPlayer.text = assistentPlayerName
        time.text = "\(timeEvent)'"
        type.text = typeEvent
        typeDetail.text = detailTypeEvent
        
    }
    
}
