//
//  LeaguesByCountryTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 24.08.22.
//

import UIKit

protocol LeaguesByCountryTableViewCellProtocol: AnyObject {
    func configureTableViewCell(leagueName: String)
}

class LeaguesByCountryTableViewCell: UITableViewCell, LeaguesByCountryTableViewCellProtocol {
    
    @IBOutlet weak var nameLeague: UILabel!
    static let key = "LeaguesByCountryTableViewCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureTableViewCell(leagueName: String) {
        nameLeague.text = leagueName
    }
}
