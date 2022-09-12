//
//  StandingViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import UIKit
import SnapKit

protocol StandingViewProtocol: AnyObject {
    func successGetStanding()
    func failure(error: Error)
    func configureView(flag: String, countryName: String, leagueId: Int, leagueName: String)
}

class StandingViewController: UIViewController, StandingViewProtocol {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var standingCollectionView: UICollectionView!
    @IBOutlet weak var standingTableView: UITableView!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var nameCountry: UILabel!
    @IBOutlet weak var leagueLogo: UIImageView!
    @IBOutlet weak var nameLeague: UILabel!
    
    var presenter: StandingViewPresenterProtocol!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        standingTableView.register(UINib(nibName: "StandingTableViewCell", bundle: nil), forCellReuseIdentifier: StandingTableViewCell.key)
        standingCollectionView.register(UINib(nibName: "StandingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: StandingCollectionViewCell.key)
        standingTableView.register(UINib(nibName: "LastFixturesByLeagueTableViewCell", bundle: nil), forCellReuseIdentifier: LastFixturesByLeagueTableViewCell.key)
        standingTableView.register(UINib(nibName: "FutureTeamInfoTableViewCell", bundle: nil), forCellReuseIdentifier: FutureTeamInfoTableViewCell.key)
        
    }
    
    func successGetStanding() {
        presenter.createView()
        guard let index = standingCollectionView.indexPathsForSelectedItems?.first else {return}
        standingTableView.tableHeaderView = standingTableView.createTableViewHeaderForStandingVC(indexPath: index, view: view)
        standingTableView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func configureView(flag: String, countryName: String, leagueId: Int, leagueName: String) {
        countryFlag.getCountryFlag(codeCountry: flag)
        nameCountry.text = countryName
        leagueLogo.getLeagueLogo(leagueId: leagueId)
        leagueLogo.layer.cornerRadius = 15
        nameLeague.text = leagueName
    }

    func failure(error: Error) {
        print(error.localizedDescription)
    }

}
