//
//  StandingTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import UIKit

protocol StandingTableViewCellProtocol: AnyObject {
    
    func configureCell(rank: Int, teamLogo: Int, teamName: String, games: Int, goalsFor: Int, goalsAgainst: Int, points: Int)
}

class StandingTableViewCell: UITableViewCell, StandingTableViewCellProtocol {
    @IBOutlet weak var teamRank: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var pointsCount: UILabel!
    @IBOutlet weak var goalsDif: UILabel!
    @IBOutlet weak var playedGames: UILabel!
    static let key = "StandingTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // Сборка ячейки
    func configureCell(rank: Int, teamLogo: Int, teamName: String, games: Int, goalsFor: Int, goalsAgainst: Int, points: Int) {
        teamRank.text = "\(rank)."
        logo.getLogoTeam(teamId: teamLogo)
        nameTeam.text = teamName
        pointsCount.text = "\(points)"
        goalsDif.text = "\(goalsFor):\(goalsAgainst)"
        playedGames.text = "\(games)"
    }
    
}
