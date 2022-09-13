//
//  EventsTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import UIKit

protocol EventsTableViewCellProtocol: AnyObject {
    
    func configureCell(playerNameFirstTeam: String, assistentPlayerNameFirstTeam: String, typeEventFirstTeam: String, detailTypeEventFirstTeam: String, timeEventFirstTeam: Int)
}

class EventsTableViewCell: UITableViewCell, EventsTableViewCellProtocol {
    
    @IBOutlet weak var timeFirstTeam: UILabel!
    @IBOutlet weak var typeFirstTeam: UILabel!
    @IBOutlet weak var typeDetailFirstTeam: UILabel!
    @IBOutlet weak var namePlayerFirstTeam: UILabel!
    @IBOutlet weak var namePlayerAssistFirstTeam: UILabel!
    
    static let key = "EventsTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(playerNameFirstTeam: String, assistentPlayerNameFirstTeam: String, typeEventFirstTeam: String, detailTypeEventFirstTeam: String, timeEventFirstTeam: Int) {
        namePlayerFirstTeam.text = playerNameFirstTeam
        namePlayerAssistFirstTeam.text = assistentPlayerNameFirstTeam
        timeFirstTeam.text = "\(timeEventFirstTeam)'"
        typeFirstTeam.text = typeEventFirstTeam
        typeDetailFirstTeam.text = detailTypeEventFirstTeam
    }
    
}
