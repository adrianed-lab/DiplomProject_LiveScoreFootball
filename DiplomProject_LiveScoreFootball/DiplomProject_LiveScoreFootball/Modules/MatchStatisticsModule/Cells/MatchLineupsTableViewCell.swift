//
//  MatchLineupsTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 6.09.22.
//

import UIKit

protocol MatchLineupsTableViewCellProtocol: AnyObject {
    func configureCell(teamFirst: String, teamSecond: String)
    func configureCellSecond(playerNameFirstTeam: String, playerNameSecondTeam: String, positionsFirstTeam: String, positionsSecondTeam: String, numberFirstTeam: Int, numberSecondTeam: Int)
}

class MatchLineupsTableViewCell: UITableViewCell, MatchLineupsTableViewCellProtocol {
    static let key = "MatchLineupsTableViewCell"
    @IBOutlet weak var firstTeam: UILabel!
    @IBOutlet weak var secondTeam: UILabel!
    @IBOutlet weak var secondTeamNumber: UILabel!
    @IBOutlet weak var firstTeamNumber: UILabel!
    @IBOutlet weak var positionSecondTeam: UILabel!
    @IBOutlet weak var positionFirstTeam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // Сборка ячеек составов команд
    func configureCell(teamFirst: String, teamSecond: String) {
        firstTeam.text = teamFirst
        secondTeam.text = teamSecond
    }
    
    func configureCellSecond(playerNameFirstTeam: String, playerNameSecondTeam: String, positionsFirstTeam: String, positionsSecondTeam: String, numberFirstTeam: Int, numberSecondTeam: Int) {
        firstTeam.text = playerNameFirstTeam
        secondTeam.text = playerNameSecondTeam
        positionFirstTeam.text = positionsFirstTeam
        positionSecondTeam.text = positionsSecondTeam
        firstTeamNumber.text = "\(numberFirstTeam)"
        secondTeamNumber.text = "\(numberSecondTeam)"
    }
    
}
