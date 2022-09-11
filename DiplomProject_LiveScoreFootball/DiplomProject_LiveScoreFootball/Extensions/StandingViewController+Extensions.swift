//
//  StandingViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import Foundation
import UIKit
import SwiftUI

extension StandingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let index = standingCollectionView.indexPathsForSelectedItems?.first else {return 0}
        if index.row == 0 {
            return presenter.countStandings()
        } else if index.row == 1 {
            return presenter.countLastFixturesByLeague()
        } else if index.row == 2 {
            return presenter.countFutureMatches()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let index = standingCollectionView.indexPathsForSelectedItems?.first else {return UITableViewCell()}
        if index.row == 0 {
            guard let cell = standingTableView.dequeueReusableCell(withIdentifier: StandingTableViewCell.key, for: indexPath) as? StandingTableViewCell else {return UITableViewCell()}
            presenter.configureCell(indexPath: indexPath, cell: cell)
            return cell
        } else if index.row == 1 {
            guard let cell = standingTableView.dequeueReusableCell(withIdentifier: LastFixturesByLeagueTableViewCell.key, for: indexPath) as? LastFixturesByLeagueTableViewCell else {return UITableViewCell()}
            presenter.configureLastMatchesCell(indexPath: indexPath, cell: cell)
            return cell
        } else if index.row == 2 {
            guard let cell = standingTableView.dequeueReusableCell(withIdentifier: FutureTeamInfoTableViewCell.key, for: indexPath) as? FutureTeamInfoTableViewCell else {return UITableViewCell()}
            presenter.configureFutureMatchesByLeague(indexPath: indexPath, cell: cell)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let index = standingCollectionView.indexPathsForSelectedItems?.first else {return}
        switch index.row {
        case 0:
            return presenter.getTeamId(indexPath: indexPath)
        case 1:
            return presenter.getFixture(indexPath: indexPath)
        default:
            break
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let index = standingCollectionView.indexPathsForSelectedItems?.first else {return 0}
        switch index.row {
        case 0:
            return 40
        case 1:
            return 80
        case 2:
            return 80
        default:
            return 0
        }
    }
    
}

extension StandingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.countCollectionItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = standingCollectionView.dequeueReusableCell(withReuseIdentifier: StandingCollectionViewCell.key, for: indexPath) as? StandingCollectionViewCell else {return UICollectionViewCell()}
            if indexPath.row == 0 {
                cell.setSelectedAttribute(isSelected: true)
                self.standingCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            }
        presenter.configureStandingCollectionViewCell(indexPath: indexPath, cell: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.getCollectionItemIndex(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
