//
//  MatchEventsViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import Foundation
import UIKit

extension MatchEventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.countEvents()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first, let cell = matchEventsTableView.dequeueReusableCell(withIdentifier: EventsTableViewCell.key, for: indexPath) as? EventsTableViewCell else {return UITableViewCell()}
        if index.row == 0 {
            presenter.configureTableCell(indexPath: indexPath, cell: cell)
            return cell
        }
    return UITableViewCell()
    }
}

extension MatchEventsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.countCollectionItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = matchEventsCollectionView.dequeueReusableCell(withReuseIdentifier: EventsCollectionViewCell.key, for: indexPath) as? EventsCollectionViewCell else {return UICollectionViewCell()}
            if indexPath.row == 0 {
                collectionCell.setSelectedAttribute(isSelected: true)
                self.matchEventsCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            }
            presenter.configureCollectionCell(indexPath: indexPath, cell: collectionCell)
            return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.getItemIndex(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
