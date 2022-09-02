//
//  DateTableViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    static let key = "DateTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateCollectionView.register(UINib(nibName: "DateCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: DateCollectionViewCell.key)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
