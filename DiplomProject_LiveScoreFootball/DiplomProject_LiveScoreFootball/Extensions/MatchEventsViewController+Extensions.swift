//
//  MatchEventsViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import Foundation
import UIKit
import SnapKit

extension MatchEventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return 0}
        if index.row == 0 {
            return 2
        } else if index.row == 2 {
            return 4
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
        case 1,2:
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return }
        switch index.row {
        case 3:
            return presenter.getFixtureId(indexPath: indexPath)
        default:
            break
        }
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

extension MatchEventsViewController {
    func createButtonView(flag: String, nameCountry: String, nameLeague: String) {
        let viewForButton = UIView()
        let imageViewForFlag = UIImageView()
        imageViewForFlag.getCountryFlag(codeCountry: flag)
        standingButton.backgroundColor = .blue
        let labelCountryName = UILabel()
        let labelLeagueName = UILabel()
        labelLeagueName.text = nameLeague
        labelLeagueName.font = UIFont(name: "Thin", size: 8)
        labelLeagueName.textColor = .white
        labelCountryName.text = "\(nameCountry):"
        labelCountryName.font = UIFont(name: "Bold", size: 10)
        labelCountryName.textColor = .white
        DispatchQueue.main.async {
            viewForButton.snp.makeConstraints { make in
                make.top.equalTo(self.standingButton).inset(0)
                make.bottom.equalTo(self.standingButton).inset(0)
                make.leading.equalTo(self.standingButton).inset(0)
                make.bottom.equalTo(self.standingButton).inset(0)
            }
            imageViewForFlag.snp.makeConstraints { make in
                make.leading.equalTo(viewForButton).inset(10)
                make.width.equalTo(25)
                make.height.equalTo(20)
                make.centerY.equalTo(viewForButton)
            }
            labelCountryName.snp.makeConstraints { make in
                make.leading.equalTo(imageViewForFlag.snp.trailing).offset(10)
                make.height.equalTo(20)
                make.centerY.equalTo(viewForButton)
            }
            
            labelLeagueName.snp.makeConstraints { make in
                make.leading.equalTo(labelCountryName.snp.trailing).offset(10)
                make.width.equalTo(150)
                make.height.equalTo(20)
                make.centerY.equalTo(viewForButton)
            }
        }
        viewForButton.addSubview(imageViewForFlag)
        viewForButton.addSubview(labelCountryName)
        viewForButton.addSubview(labelLeagueName)
        standingButton.addSubview(viewForButton)
    }
    
    func configureView(logoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsFirstTeam: Int, goalsSecondTeam: Int, dateMatch: String) {
        let imageViewForHomeTeamLogo = UIImageView()
        let imageViewForAwayTeamLogo = UIImageView()
        DispatchQueue.main.async {
            imageViewForHomeTeamLogo.snp.makeConstraints { make in
                make.width.equalTo(70)
                make.height.equalTo(70)
                make.top.equalTo(self.buttonHomeTeam).inset(0)
                make.bottom.equalTo(self.buttonHomeTeam).inset(0)
                make.leading.equalTo(self.buttonHomeTeam).inset(0)
                make.bottom.equalTo(self.buttonHomeTeam).inset(0)
            }
            imageViewForAwayTeamLogo.snp.makeConstraints { make in
                make.width.equalTo(70)
                make.height.equalTo(70)
                make.top.equalTo(self.buttonAwayTeam).inset(0)
                make.bottom.equalTo(self.buttonAwayTeam).inset(0)
                make.leading.equalTo(self.buttonAwayTeam).inset(0)
                make.bottom.equalTo(self.buttonAwayTeam).inset(0)
            }
        }
        buttonHomeTeam.addSubview(imageViewForHomeTeamLogo)
        buttonAwayTeam.addSubview(imageViewForAwayTeamLogo)
        imageViewForHomeTeamLogo.getLogoTeam(teamId: logoFirstTeam)
        imageViewForAwayTeamLogo.getLogoTeam(teamId: logoSecondTeam)
        firstTeamName.text = nameFirstTeam
        secondTeamName.text = nameSecondTeam
        matchStart.text = dateMatch
        matchResult.text = "\(goalsFirstTeam) - \(goalsSecondTeam)"
    }
}
