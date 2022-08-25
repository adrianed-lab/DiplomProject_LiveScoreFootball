//
//  StandingViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import Foundation
import UIKit

extension StandingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.countStandings()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = standingTableView.dequeueReusableCell(withIdentifier: StandingTableViewCell.key, for: indexPath) as? StandingTableViewCell else {return UITableViewCell()}
        presenter.configureCell(indexPath: indexPath, cell: cell)
        return cell
    }
    
    
}
