//
//  TeamInfoViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 30.08.22.
//

import UIKit

protocol TeamInfoViewProtocol: AnyObject {
    func successGetInfo()
    func failureGetInfo(error: Error)
}

class TeamInfoViewController: UIViewController, TeamInfoViewProtocol {
    @IBOutlet weak var teamInfoTableView: UITableView!
    @IBOutlet weak var teamInfoCollectionView: UICollectionView!
    var presenter: TeamInfoViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamInfoTableView.register(UINib(nibName: "TeamInfoTableViewCell", bundle: nil), forCellReuseIdentifier: TeamInfoTableViewCell.key)
        teamInfoTableView.register(UINib(nibName: "FutureTeamInfoTableViewCell", bundle: nil), forCellReuseIdentifier: FutureTeamInfoTableViewCell.key)
        teamInfoCollectionView.register(UINib(nibName: "TeamInfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TeamInfoCollectionViewCell.key)
    }
    
    func successGetInfo() {
        teamInfoTableView.reloadData()
    }
        
    func failureGetInfo(error: Error) {
        print(error.localizedDescription)
    }

}
