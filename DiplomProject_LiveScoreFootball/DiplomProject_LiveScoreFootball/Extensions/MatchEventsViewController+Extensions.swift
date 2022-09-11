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
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return 0}
        if index.row == 0 {
            return 2
        } else if index.row == 1 {
            return 1
        } else if index.row == 2 {
            return 4
        } else if index.row == 3 {
            return 1
        }
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return 0}
        if index.row == 0 {
            return section == 0 ? presenter.countEventsFirstTeam() : presenter.countEventsSecondTeam()
        } else if index.row == 1 {
            return presenter.countStatisticsItems()
        } else if index.row == 2 {
            switch section {
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return 11
            case 3:
                return 6
            default:
                break
            }
        } else if index.row == 3 {
            return presenter.countH2HMatches()
        } else if index.row == 4 {
            return presenter.countStadingsItems()
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return UITableViewCell()}
        if index.row == 0 {
            switch indexPath.section {
            case 0:
                guard let cell = matchEventsTableView.dequeueReusableCell(withIdentifier: EventsTableViewCell.key, for: indexPath) as? EventsTableViewCell else {return UITableViewCell()}
                presenter.configureFirstTeamTableCell(indexPath: indexPath, cell: cell)
                return cell
            case 1:
                guard let cell = matchEventsTableView.dequeueReusableCell(withIdentifier: SecondTeamEventsTableViewCell.key, for: indexPath) as? SecondTeamEventsTableViewCell else {return UITableViewCell()}
                presenter.configureSecondTeamTableCell(indexPath: indexPath, cell: cell)
                return cell
            default:
                break
            }
        } else if index.row == 1 {
            guard let cell = matchEventsTableView.dequeueReusableCell(withIdentifier: StatisticsTableViewCell.key, for: indexPath) as? StatisticsTableViewCell else {return UITableViewCell()}
            presenter.configureStatisticsTableCell(indexPath: indexPath, cell: cell)
            return cell
        } else if index.row == 2 {
            guard let cell = matchEventsTableView.dequeueReusableCell(withIdentifier: MatchLineupsTableViewCell.key, for: indexPath) as? MatchLineupsTableViewCell else {return UITableViewCell()}
            presenter.configureMatchLineupsCell(indexPath: indexPath, cell: cell)
            return cell
        } else if index.row == 3 {
            guard let cell = matchEventsTableView.dequeueReusableCell(withIdentifier: LastFixturesByLeagueTableViewCell.key, for: indexPath) as? LastFixturesByLeagueTableViewCell else {return UITableViewCell()}
            presenter.configureMatchesH2HCell(indexPath: indexPath, cell: cell)
            return cell
        } else if index.row == 4 {
            guard let cell = matchEventsTableView.dequeueReusableCell(withIdentifier: StandingTableViewCell.key, for: indexPath) as? StandingTableViewCell else {return UITableViewCell()}
            presenter.configureStandingCell(indexPath: indexPath, cell: cell)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return 0}
        switch index.row {
        case 0:
            return 100
        case 1:
            return 50
        case 2:
            return 50
        case 3:
            return 80
        case 4:
            return 40
        default:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return ""}
        if index.row == 0 {
            return section == 0 ? presenter.getFirstTeamName(): presenter.getSecondTeamName()
        } else if index.row == 2 {
            switch section {
            case 0:
                return "COACHES"
            case 1:
                return "FORMATIONS"
            case 2:
                return "START XI"
            case 3:
                return "SUBSTITUTES"
            default:
                break
            }
        } else if index.row == 3 {
            return "H2H MATCHES"
        }
        return ""
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
