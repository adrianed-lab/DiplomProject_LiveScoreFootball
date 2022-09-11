//
//  StandingCollectionViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 7.09.22.
//

import UIKit
import SwiftUI

protocol StandingCollectionViewCellProtocol {
    func configureCell(item: String)
}

class StandingCollectionViewCell: UICollectionViewCell, StandingCollectionViewCellProtocol {
    
    static let key = "StandingCollectionViewCell"
    @IBOutlet weak var nameItem: UILabel!
    
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
