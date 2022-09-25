//
//  LiveTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import UIKit

protocol LiveTableViewCellProtocol {
    func configureCell(firstTeamLogo: Int, secondTeamLogo: Int, firstTeamName: String, secondTeamName: String, currentTimeInfo: Int, homeGoalsTeam: Int, awayGoalsTeam: Int )
}

class LiveTableViewCell: UITableViewCell, LiveTableViewCellProtocol {
    
    @IBOutlet weak var nameFirstTeam: UILabel!
    @IBOutlet weak var nameSecondTeam: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var goalsHomeTeam: UILabel!
    @IBOutlet weak var goalsAwayTeam: UILabel!
    @IBOutlet weak var logoFirstTeam: UIImageView!
    @IBOutlet weak var logoSecondTeam: UIImageView!
    static let key = "LiveTableViewCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // Сборка ячейки
    func configureCell(firstTeamLogo: Int, secondTeamLogo: Int, firstTeamName: String, secondTeamName: String, currentTimeInfo: Int, homeGoalsTeam: Int, awayGoalsTeam: Int) {
        logoFirstTeam.getLogoTeam(teamId: firstTeamLogo)
        logoSecondTeam.getLogoTeam(teamId: secondTeamLogo)
        nameFirstTeam.text = firstTeamName
        nameSecondTeam.text = secondTeamName
        currentTime.text = "\(currentTimeInfo)'"
        goalsHomeTeam.text = "\(homeGoalsTeam)"
        goalsAwayTeam.text = "\(awayGoalsTeam)"
    }

}
