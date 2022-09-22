//
//  LeaguesByCountryName+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 24.08.22.
//

import Foundation
import UIKit

extension LeaguesByCountryViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.countLeagues()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = leaguesByCountryTable.dequeueReusableCell(withIdentifier: LeaguesByCountryTableViewCell.key, for: indexPath) as? LeaguesByCountryTableViewCell else {return UITableViewCell()}
        presenter.configureCell(indexPath: indexPath, cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.getLeagueId(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}
