//
//  ScoreViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 17.08.22.
//

import Foundation
import UIKit

extension ScoreViewController: ScoreViewProtocol {
    func successGetMatchesByDate() {
        tableViewMatchesByDate.reloadData()
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

extension ScoreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let leagues = presenter.leaguesBySeason?.response else {return Int()}
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMatchesByDate.dequeueReusableCell(withIdentifier: ScoreTableViewCell.key, for: indexPath)
        guard let leagues = presenter.leaguesBySeason?.response else {return UITableViewCell()}
            let league = leagues[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = league.country.name
            content.secondaryText = league.league.name
            cell.contentConfiguration = content
            return cell
            
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? TypeEnum.cup.rawValue : TypeEnum.league.rawValue
    }
   // func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //
    //}
    
    
}
