//
//  LiveViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import Foundation
import UIKit

extension LiveViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getLeaguesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = liveTableView.dequeueReusableCell(withIdentifier: LiveTableViewCell.key, for: indexPath) as? LiveTableViewCell else {return UITableViewCell()}
        presenter.configureLiveTableViewCell(indexPath: indexPath, cell: cell)
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
}
