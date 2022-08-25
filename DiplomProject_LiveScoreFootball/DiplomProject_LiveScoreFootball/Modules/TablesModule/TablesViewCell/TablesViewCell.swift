//
//  TablesViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 22.08.22.
//

import UIKit
protocol TablesViewCellProtocol: AnyObject {
    func configureCell(nameCountry: String, logoCountry: String)
}

class TablesViewCell: UITableViewCell, TablesViewCellProtocol {
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    static let key = "TablesViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(nameCountry: String, logoCountry: String) {
        countryName.text = nameCountry
        //countryImage
    }
}
