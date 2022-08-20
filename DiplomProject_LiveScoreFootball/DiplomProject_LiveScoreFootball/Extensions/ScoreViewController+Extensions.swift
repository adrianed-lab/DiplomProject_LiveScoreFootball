//
//  ScoreViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 17.08.22.
//

import Foundation
import UIKit



extension ScoreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getLeaguesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewMatchesByDate.dequeueReusableCell(withIdentifier: ScoreTableViewCell.key, for: indexPath) as? ScoreTableViewCell else {return UITableViewCell()}
        presenter.scoreTableViewCellConfigure(indexPath: indexPath, cell: cell)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? TypeEnum.cup.rawValue : TypeEnum.league.rawValue
    }
    
   // func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //
    //}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}
