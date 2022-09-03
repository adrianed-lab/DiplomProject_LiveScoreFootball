//
//  TeamInfoTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 30.08.22.
//

import UIKit

protocol TeamInfoTableViewCellProtocol: AnyObject {
    func configureCell(date: String, lofoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsHome: Int, goalsAway: Int, win: Bool)
}

class TeamInfoTableViewCell: UITableViewCell, TeamInfoTableViewCellProtocol {
    
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var teamFirstLogo: UIImageView!
    @IBOutlet weak var teamSecondLogo: UIImageView!
    @IBOutlet weak var teamFirstName: UILabel!
    @IBOutlet weak var teamSecondName: UILabel!
    @IBOutlet weak var matchResult: UILabel!
    @IBOutlet weak var homeGoals: UILabel!
    @IBOutlet weak var awayGoals: UILabel!
    
    static let key = "TeamInfoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(date: String, lofoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsHome: Int, goalsAway: Int, win: Bool) {
        matchDate.text = date
        teamFirstLogo.getLogoTeam(teamId: lofoFirstTeam)
        teamSecondLogo.getLogoTeam(teamId: logoSecondTeam)
        teamFirstName.text = nameFirstTeam
        teamSecondName.text = nameSecondTeam
        homeGoals.text = "\(goalsHome)"
        awayGoals.text = "\(goalsAway)"
        matchResult.text = win ? "W" : "L"
    }
}
