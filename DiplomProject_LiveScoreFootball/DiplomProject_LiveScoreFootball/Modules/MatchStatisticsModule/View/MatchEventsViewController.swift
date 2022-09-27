//
//  MatchEventsViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import UIKit
import SnapKit

protocol MatchEventsViewProtocol: AnyObject {
    func successGetEvents()
    func failureGetEvents(error: Error)
    func openWarningMessage(infoLabel: String)
    func configureMatchEventView(logoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsFirstTeam: Int, goalsSecondTeam: Int, dateMatch: String)
    func configureButton(flag: String, nameCountry: String, nameLeague: String)
    func hideView()
}

class MatchEventsViewController: UIViewController, MatchEventsViewProtocol {
    @IBOutlet weak var infoLabelForEmptyResponse: UILabel!
    @IBOutlet weak var imageViewForEmptyResponse: UIImageView!
    @IBOutlet weak var viewForEmptyResponse: UIView!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var matchResult: UILabel!
    @IBOutlet weak var matchStart: UILabel!
    @IBOutlet weak var matchEventsTableView: UITableView!
    @IBOutlet weak var matchEventsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var standingButton: UIButton!
    @IBOutlet weak var buttonHomeTeam: UIButton!
    @IBOutlet weak var buttonAwayTeam: UIButton!
    var presenter: MatchEventsViewPresenterProtocol!
    var shareWindowButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(shareScreen(_:)))
        button.tintColor = .black
        button.width = 30
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Event Info"
        presenter.createView()
        activityIndicator.startAnimating()
        matchEventsTableView.register(UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: EventsTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "SecondTeamEventsTableViewCell", bundle: nil), forCellReuseIdentifier: SecondTeamEventsTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "StatisticsTableViewCell", bundle: nil), forCellReuseIdentifier: StatisticsTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "MatchLineupsTableViewCell", bundle: nil), forCellReuseIdentifier: MatchLineupsTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "LastFixturesByLeagueTableViewCell", bundle: nil), forCellReuseIdentifier: LastFixturesByLeagueTableViewCell.key)
        matchEventsTableView.register(UINib(nibName: "StandingTableViewCell", bundle: nil), forCellReuseIdentifier: StandingTableViewCell.key)
        matchEventsCollectionView.register(UINib(nibName: "EventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: EventsCollectionViewCell.key)
        navigationItem.rightBarButtonItem = shareWindowButton
        viewForEmptyResponse.isHidden = true
        }
    
    
    
    func successGetEvents() {
        presenter.createButtonOpenStanding()
        guard let index = matchEventsCollectionView.indexPathsForSelectedItems?.first else {return}
        matchEventsTableView.tableHeaderView = matchEventsTableView.createTitleViewHeaderForMatchEventsVC(indexPath: index, view: view)
        matchEventsTableView.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func failureGetEvents(error: Error) {
        print(error.localizedDescription)
    }
    
    //MARK: Сборка кнопки и главной view
    func configureButton(flag: String, nameCountry: String, nameLeague: String) {
        createButtonView(flag: flag, nameCountry: nameCountry, nameLeague: nameLeague)
    }
    
    func configureMatchEventView(logoFirstTeam: Int, logoSecondTeam: Int, nameFirstTeam: String, nameSecondTeam: String, goalsFirstTeam: Int, goalsSecondTeam: Int, dateMatch: String) {
        configureView(logoFirstTeam: logoFirstTeam, logoSecondTeam: logoSecondTeam, nameFirstTeam: nameFirstTeam, nameSecondTeam: nameSecondTeam, goalsFirstTeam: goalsFirstTeam, goalsSecondTeam: goalsSecondTeam, dateMatch: dateMatch)
    }
    
    // Открытие информационного окна
    func openWarningMessage(infoLabel: String) {
        let allertView = UIAlertController(title: "Oops!", message: "Data not found!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel) { _ in
            self.infoLabelForEmptyResponse.text = infoLabel
            self.viewForEmptyResponse.isHidden = false
        }
        allertView.addAction(okButton)
        self.present(allertView, animated: true)
    }
    
    //MARK: Кнопки для переходов на экраны
    @IBAction func showStandingVC(_ sender: Any) {
        presenter.openStandingVC()
    }
    
    @IBAction func showHomeTeamInfo(_ sender: Any) {
        presenter.showHomeTeamInfo()
    }
    
    @IBAction func showAwayTeamInfo(_ sender: Any) {
        presenter.showAwayTeamInfo()
    }
    
    //MARK: кнопки для добавления в избранное
    @IBAction func addToFavourites(_ sender: Any) {
        // Будет реализовано добавление в избранное
    }
    
    @IBAction func addToFavouritesAwayTeam(_ sender: Any) {
        // Будет реализовано добавление в избранное
    }
    
    // Кнопа для отправки скриншота
    @objc func shareScreen(_ sender: UIBarButtonItem) {
        let screenShot = self.view.takeScreenShot()
        let shareController = UIActivityViewController(activityItems: [screenShot], applicationActivities: nil)
        present(shareController, animated: true)
    }
    
    func hideView() {
        viewForEmptyResponse.isHidden = true
    }

}
