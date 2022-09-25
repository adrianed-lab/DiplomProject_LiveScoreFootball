//
//  LastFixturesByLeagueTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 8.09.22.
//

import UIKit

protocol LastFixturesByLeagueTableViewCellProtocol {
    func configureCell(date: String, lofoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsHome: Int, goalsAway: Int)
}

class LastFixturesByLeagueTableViewCell: UITableViewCell, LastFixturesByLeagueTableViewCellProtocol {
    
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var teamFirstLogo: UIImageView!
    @IBOutlet weak var teamSecondLogo: UIImageView!
    @IBOutlet weak var teamFirstName: UILabel!
    @IBOutlet weak var teamSecondName: UILabel!
    @IBOutlet weak var homeGoals: UILabel!
    @IBOutlet weak var awayGoals: UILabel!
    static let key = "LastFixturesByLeagueTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // Сборка ячейки
    func configureCell(date: String, lofoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsHome: Int, goalsAway: Int) {
        matchDate.text = date
        teamFirstLogo.getLogoTeam(teamId: lofoFirstTeam)
        teamSecondLogo.getLogoTeam(teamId: logoSecondTeam)
        teamFirstName.text = nameFirstTeam
        teamSecondName.text = nameSecondTeam
        homeGoals.text = "\(goalsHome)"
        awayGoals.text = "\(goalsAway)"
    }
    
    
}
