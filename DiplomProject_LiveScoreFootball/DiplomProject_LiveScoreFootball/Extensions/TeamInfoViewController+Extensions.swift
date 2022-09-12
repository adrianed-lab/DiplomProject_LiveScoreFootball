//
//  TeamInfoViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 30.08.22.
//

import Foundation
import UIKit

extension TeamInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let index = teamInfoCollectionView.indexPathsForSelectedItems?.first else {return 0}
        if index.row == 0 {
            return presenter.countLastFixtures()
        } else if index.row == 1 {
            return presenter.countFutureFixtures()
        } else if index.row == 2 {
            return presenter.countStandingItems()
        } else {
            return presenter.countPlayers()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let index = teamInfoCollectionView.indexPathsForSelectedItems?.first else {return UITableViewCell()}
        if index.row == 0 {
            guard let cell = teamInfoTableView.dequeueReusableCell(withIdentifier: LastFixturesByLeagueTableViewCell.key, for: indexPath) as? LastFixturesByLeagueTableViewCell else {return UITableViewCell()}
            presenter.configureTableCell(indexPath: indexPath, cell: cell)
        return cell
        } else if index.row == 1 {
           guard let cell = teamInfoTableView.dequeueReusableCell(withIdentifier: FutureTeamInfoTableViewCell.key, for: indexPath) as? FutureTeamInfoTableViewCell else {return UITableViewCell()}
            presenter.configureFutureTeamInfoTableCell(indexPath: indexPath, cell: cell)
            return cell
        } else if index.row == 2 {
            guard let cell = teamInfoTableView.dequeueReusableCell(withIdentifier: StandingTableViewCell.key, for: indexPath) as? StandingTableViewCell else {return UITableViewCell()}
             presenter.configureStandingCell(indexPath: indexPath, cell: cell)
            return cell
        } else if index.row == 3 {
            guard let cell = teamInfoTableView.dequeueReusableCell(withIdentifier: PlayersByTeamIdTableViewCell.key, for: indexPath) as? PlayersByTeamIdTableViewCell else {return UITableViewCell()}
             presenter.configurePlayersCell(indexPath: indexPath, cell: cell)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let index = teamInfoCollectionView.indexPathsForSelectedItems?.first else {return 0}
        switch index.row {
        case 2:
            return 40
        case 3:
            return 50
        default:
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let index = teamInfoCollectionView.indexPathsForSelectedItems?.first else {return}
        switch index.row {
        case 0:
            return presenter.getFixtureIdIndex(indexPath: indexPath)
        default:
            break
        }
    }
    
    
}

extension TeamInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.countCollectionItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = teamInfoCollectionView.dequeueReusableCell(withReuseIdentifier: TeamInfoCollectionViewCell.key, for: indexPath) as? TeamInfoCollectionViewCell else {return UICollectionViewCell()}
        DispatchQueue.main.async {
            if indexPath.row == 0 {
                cell.setSelectedAttribute(isSelected: true)
                self.teamInfoCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            }
        }
        presenter.configureCollectionViewCell(indexPath: indexPath, cell: cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.getItemIndex(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


