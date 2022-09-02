//
//  EventsCollectionViewCell.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import UIKit

protocol EventsCollectionViewCellProtocol: AnyObject {
    func configureCell(collectionItem: String)
}

class EventsCollectionViewCell: UICollectionViewCell, EventsCollectionViewCellProtocol {
    
    @IBOutlet weak var collectionItemName: UILabel!
    
    static let key = "EventsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override var isSelected: Bool {
        didSet {
            setSelectedAttribute(isSelected: isSelected)
        }
    }
    func setSelectedAttribute(isSelected: Bool) {
        collectionItemName.textColor = isSelected ? .red : .black
    }
    
    func configureCell(collectionItem: String) {
        collectionItemName.text = collectionItem
    }

}
