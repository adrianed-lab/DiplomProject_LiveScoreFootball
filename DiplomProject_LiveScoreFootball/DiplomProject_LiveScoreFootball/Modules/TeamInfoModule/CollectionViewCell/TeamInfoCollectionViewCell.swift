//
//  TeamInfoCollectionViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 1.09.22.
//

import UIKit

protocol TeamInfoCollectionViewCellProtocol: AnyObject {
    func configureCell(item: String)
}

class TeamInfoCollectionViewCell: UICollectionViewCell, TeamInfoCollectionViewCellProtocol  {
    
    @IBOutlet weak var nameItem: UILabel!
    static let key = "TeamInfoCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        didSet {
            setSelectedAttribute(isSelected: isSelected)
        }
    }
    
    func setSelectedAttribute(isSelected: Bool) {
        nameItem.textColor = isSelected ? .red : .black
    }

    func configureCell(item: String) {
        nameItem.text = item
    }
}
