//
//  TableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 17.08.22.
//

import UIKit

protocol ScoreTableViewCellProtocol: AnyObject {
    
    func configureCell(codeCountry: String, countryNameInfo: String, leagueName: String)
    }

class ScoreTableViewCell: UITableViewCell, ScoreTableViewCellProtocol {
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var leagueOrCupName: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    static let key = "ScoreTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(codeCountry: String, countryNameInfo: String, leagueName: String) {
        countryName.text = countryNameInfo
//        countryFlag.image =
        leagueOrCupName.text = leagueName
    }
}
