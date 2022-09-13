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
    func configureView(countryCode: String, nameCountry: String, teamId: Int, nameTeam: String)
}

class TeamInfoViewController: UIViewController, TeamInfoViewProtocol {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var teamInfoTableView: UITableView!
    @IBOutlet weak var teamInfoCollectionView: UICollectionView!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    
    var presenter: TeamInfoViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        teamInfoTableView.register(UINib(nibName: "FutureTeamInfoTableViewCell", bundle: nil), forCellReuseIdentifier: FutureTeamInfoTableViewCell.key)
        teamInfoTableView.register(UINib(nibName: "StandingTableViewCell", bundle: nil), forCellReuseIdentifier: StandingTableViewCell.key)
        teamInfoTableView.register(UINib(nibName: "PlayersByTeamIdTableViewCell", bundle: nil), forCellReuseIdentifier: PlayersByTeamIdTableViewCell.key)
        teamInfoTableView.register(UINib(nibName: "LastFixturesByLeagueTableViewCell", bundle: nil), forCellReuseIdentifier: LastFixturesByLeagueTableViewCell.key)
        teamInfoCollectionView.register(UINib(nibName: "TeamInfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TeamInfoCollectionViewCell.key)
    }
    
    func successGetInfo() {
        presenter.configureView()
        guard let index = teamInfoCollectionView.indexPathsForSelectedItems?.first else {return}
        teamInfoTableView.tableHeaderView = teamInfoTableView.createTitleViewHeaderForTeamInfoVC(indexPath: index, view: view)
        teamInfoTableView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
        

    }
        
    func failureGetInfo(error: Error) {
        print(error.localizedDescription)
    }
    
    func configureView(countryCode: String, nameCountry: String, teamId: Int, nameTeam: String) {
        countryFlag.getCountryFlag(codeCountry: countryCode)
        teamLogo.getLogoTeam(teamId: teamId)
        countryName.text = nameCountry
        teamName.text = nameTeam
    }
}
