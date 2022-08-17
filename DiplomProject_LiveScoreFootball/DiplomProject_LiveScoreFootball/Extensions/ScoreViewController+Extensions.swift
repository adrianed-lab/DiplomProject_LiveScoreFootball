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
        guard let leagues = presenter.matchesBydate?.data else {return Int()}
        return leagues.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let matches = presenter.matchesBydate?.data[section].matches else {return Int()}
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMatchesByDate.dequeueReusableCell(withIdentifier: ScoreTableViewCell.key, for: indexPath)
        guard let matches = presenter.matchesBydate?.data.first?.matches else {return UITableViewCell()}
        let match = matches[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = match.team1.name
        content.secondaryText = match.team2.name
        content.textProperties.font = UIFont(name: "Regular", size: 17)!
        content.secondaryTextProperties.font = UIFont(name: "Regular", size: 17)!
        cell.contentConfiguration = content
        return cell
    }
   // func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //
    //}
    
    
}
