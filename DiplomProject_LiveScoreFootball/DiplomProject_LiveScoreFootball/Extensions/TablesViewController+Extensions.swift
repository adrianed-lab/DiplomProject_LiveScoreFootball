//
//  TablesViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import Foundation
import UIKit

extension TablesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getCountCountries()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = countriesTableView.dequeueReusableCell(withIdentifier: TablesViewCell.key, for: indexPath) as? TablesViewCell else {return UITableViewCell()}
        presenter.configureTablesViewCell(indexPath: indexPath, cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.getCountryNameByTap(indexPath: indexPath)
    }
    
    
}
