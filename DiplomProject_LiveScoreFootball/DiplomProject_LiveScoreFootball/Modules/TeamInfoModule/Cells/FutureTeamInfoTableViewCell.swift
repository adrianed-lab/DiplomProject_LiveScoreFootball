//
//  FutureTeamInfoTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 1.09.22.
//

import UIKit

protocol FutureTeamInfoTableViewCellProtocol {
    
    func configureCell(matchDate: String, firstTeamLogo: Int, secondTeamLogo: Int, firstTeamName: String, secondTeamName: String, matchStart: String)
}

class FutureTeamInfoTableViewCell: UITableViewCell, FutureTeamInfoTableViewCellProtocol {
    
    @IBOutlet weak var dateMatch: UILabel!
    @IBOutlet weak var logoFirstTeam: UIImageView!
    @IBOutlet weak var logoSecondTeam: UIImageView!
    @IBOutlet weak var nameFirstTeam: UILabel!
    @IBOutlet weak var nameSecondTeam: UILabel!
    @IBOutlet weak var startMatch: UILabel!
    
    static let key = "FutureTeamInfoTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    // Сборка ячейки будущих матчей
    func configureCell(matchDate: String, firstTeamLogo: Int, secondTeamLogo: Int, firstTeamName: String, secondTeamName: String, matchStart: String) {
        dateMatch.text = matchDate
        logoFirstTeam.getLogoTeam(teamId: firstTeamLogo)
        logoSecondTeam.getLogoTeam(teamId: secondTeamLogo)
        nameFirstTeam.text = firstTeamName
        nameSecondTeam.text = secondTeamName
        startMatch.text = matchStart
    }
}
   
