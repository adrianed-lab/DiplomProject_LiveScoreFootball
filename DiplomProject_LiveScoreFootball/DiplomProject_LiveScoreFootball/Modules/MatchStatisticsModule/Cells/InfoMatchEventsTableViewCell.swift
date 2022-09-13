//
//  InfoMatchEventsTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 10.09.22.
//

import UIKit

protocol InfoMatchEventsTableViewCellProtocol {
    func configureCell(logoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsFirstTeam: Int, goalsSecondTeam: Int, dateMatch: String)
}

class InfoMatchEventsTableViewCell: UITableViewCell, InfoMatchEventsTableViewCellProtocol {
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var logoHomeTeam: UIImageView!
    @IBOutlet weak var logoAwayTeam: UIImageView!
    @IBOutlet weak var matchResult: UILabel!
    @IBOutlet weak var matchStart: UILabel!
    static let key = "InfoMatchEventsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func addToFavouritesHomeTeam(_ sender: Any) {
    }
    @IBAction func addToFavouritesAwayTeam(_ sender: Any) {
    }
    func configureCell(logoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsFirstTeam: Int, goalsSecondTeam: Int, dateMatch: String) {
        logoHomeTeam.getLogoTeam(teamId: logoFirstTeam)
        logoAwayTeam.getLogoTeam(teamId: logoSecondTeam)
        firstTeamName.text = nameFirstTeam
        secondTeamName.text = nameSecondTeam
        matchStart.text = dateMatch
        matchResult.text = "\(goalsFirstTeam) - \(goalsSecondTeam)"
    }
}
