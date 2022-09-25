//
//  StatisticsTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 4.09.22.
//

import UIKit
protocol StatisticsTableViewCellProtocol {
    func configureCell(type: String, valueFirstTeam: Value, valueSecondTeam: Value)
}

class StatisticsTableViewCell: UITableViewCell, StatisticsTableViewCellProtocol {
    @IBOutlet weak var typeStatistic: UILabel!
    @IBOutlet weak var firstTeamValue: UILabel!
    @IBOutlet weak var secondTeamValue: UILabel!
    
    static let key = "StatisticsTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    // Метод сборки ячейки со статистикой
    func configureCell(type: String, valueFirstTeam: Value, valueSecondTeam: Value) {
        typeStatistic.text = type
        firstTeamValue.text = "\(valueFirstTeam)"
        secondTeamValue.text = "\(valueSecondTeam)"
    }
    
}
