//
//  InfoForStandingTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 10.09.22.
//

import UIKit

protocol InfoForStandingTableViewCellProtocol {
    func configureCell(number: String, team: String, matches: String, goals: String, points: String)
}

class InfoForStandingTableViewCell: UITableViewCell, InfoForStandingTableViewCellProtocol {
    @IBOutlet weak var teamNumber: UILabel!
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var pointsTeam: UILabel!
    @IBOutlet weak var goalsTeam: UILabel!
    @IBOutlet weak var matchesTeam: UILabel!
    static let key = "InfoForStandingTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(number: String, team: String, matches: String, goals: String, points: String) {
        teamNumber.text = number
        nameTeam.text = team
        pointsTeam.text = points
        goalsTeam.text = goals
        matchesTeam.text = matches
    }
}
