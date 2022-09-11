//
//  MatchEventsViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import UIKit

protocol MatchEventsViewProtocol: AnyObject {
    func successGetEvents()
    func failureGetEvents(error: Error)
    func openWarningMessage()
    func configureView(logoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsFirstTeam: Int, goalsSecondTeam: Int, dateMatch: String)
}

class MatchEventsViewController: UIViewController, MatchEventsViewProtocol {
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var logoHomeTeam: UIImageView!
    @IBOutlet weak var logoAwayTeam: UIImageView!
    @IBOutlet weak var matchResult: UILabel!
    @IBOutlet weak var matchStart: UILabel!
    @IBOutlet weak var matchEventsTableView: UITableView!
    @IBOutlet weak var matchEventsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: MatchEventsViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        matchEventsTableView.register(UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: EventsTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "SecondTeamEventsTableViewCell", bundle: nil), forCellReuseIdentifier: SecondTeamEventsTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "StatisticsTableViewCell", bundle: nil), forCellReuseIdentifier: StatisticsTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "MatchLineupsTableViewCell", bundle: nil), forCellReuseIdentifier: MatchLineupsTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "LastFixturesByLeagueTableViewCell", bundle: nil), forCellReuseIdentifier: LastFixturesByLeagueTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "StandingTableViewCell", bundle: nil), forCellReuseIdentifier: StandingTableViewCell.key)
        matchEventsCollectionView.register(UINib(nibName: "EventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: EventsCollectionViewCell.key)
        }
    
    func successGetEvents() {
        presenter.createView()
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return}
        matchEventsTableView.tableHeaderView = matchEventsTableView.createTitleViewHeaderForMatchEventsVC(indexPath: index, view: view)
        matchEventsTableView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func failureGetEvents(error: Error) {
        print(error.localizedDescription)
    }
    
    func configureView(logoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsFirstTeam: Int, goalsSecondTeam: Int, dateMatch: String) {
        logoHomeTeam.getLogoTeam(teamId: logoFirstTeam)
        logoAwayTeam.getLogoTeam(teamId: logoSecondTeam)
        firstTeamName.text = nameFirstTeam
        secondTeamName.text = nameSecondTeam
        matchStart.text = dateMatch
        matchResult.text = "\(goalsFirstTeam) - \(goalsSecondTeam)"
    }
    
    func openWarningMessage() {
        let allertView = UIAlertController(title: "Oops!", message: "Match has't statistics", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel)
        allertView.addAction(okButton)
        self.present(allertView, animated: true)
    }
    
    @IBAction func addToFavourites(_ sender: Any) {
        
    }
    
    @IBAction func addToFavouritesAwayTeam(_ sender: Any) {
        
    }
    

}
