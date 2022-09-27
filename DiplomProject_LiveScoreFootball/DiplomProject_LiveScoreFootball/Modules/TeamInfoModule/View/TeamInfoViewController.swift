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
    var shareWindowButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(shareSkreen(_:)))
        button.tintColor = .black
        button.width = 30
        return button
    }
    var addToFavouritesButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: UIImage(systemName: "star"), style: .done, target: self, action: #selector(addToFavourites(_:)))
        button.tintColor = .black
        button.width = 30
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Team Info"
        presenter.configureView()
        activityIndicator.startAnimating()
        teamInfoTableView.register(UINib(nibName: "FutureTeamInfoTableViewCell", bundle: nil), forCellReuseIdentifier: FutureTeamInfoTableViewCell.key)
        teamInfoTableView.register(UINib(nibName: "StandingTableViewCell", bundle: nil), forCellReuseIdentifier: StandingTableViewCell.key)
        teamInfoTableView.register(UINib(nibName: "PlayersByTeamIdTableViewCell", bundle: nil), forCellReuseIdentifier: PlayersByTeamIdTableViewCell.key)
        teamInfoTableView.register(UINib(nibName: "LastFixturesByLeagueTableViewCell", bundle: nil), forCellReuseIdentifier: LastFixturesByLeagueTableViewCell.key)
        teamInfoCollectionView.register(UINib(nibName: "TeamInfoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TeamInfoCollectionViewCell.key)
        navigationItem.rightBarButtonItems = [/*addToFavouritesButton*/ shareWindowButton]
    }
    
    func successGetInfo() {
        guard let index = teamInfoCollectionView.indexPathsForSelectedItems?.first else {return}
        teamInfoTableView.tableHeaderView = teamInfoTableView.createTitleViewHeaderForTeamInfoVC(indexPath: index, view: view)
        teamInfoTableView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
        
    func failureGetInfo(error: Error) {
        print(error.localizedDescription)
    }
    
    // Сборка view
    func configureView(countryCode: String, nameCountry: String, teamId: Int, nameTeam: String) {
        DispatchQueue.main.async {
            self.countryFlag.getCountryFlag(codeCountry: countryCode)
            self.teamLogo.getLogoTeam(teamId: teamId)
            self.countryName.text = nameCountry
            self.teamName.text = nameTeam
        }
    }
    
    // Скриншот экрана
    @objc func shareSkreen(_ sender: UIBarButtonItem) {
        let screenShot = self.view.takeScreenShot()
        let shareController = UIActivityViewController(activityItems: [screenShot], applicationActivities: nil)
        present(shareController, animated: true)
    }
    
    // Добавление в избранное
    @objc func addToFavourites(_ sender: UIBarButtonItem) {
        // Будет реализовано добавление команды в избранное
    }
}
