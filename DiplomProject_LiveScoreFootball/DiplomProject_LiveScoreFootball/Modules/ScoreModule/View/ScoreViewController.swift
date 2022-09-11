//
//  ViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 9.08.22.
//

import UIKit

protocol ScoreViewProtocol: AnyObject {
    func successGetLeaguesBySeason()
    func failure(error: Error)
}

class ScoreViewController: UIViewController, ScoreViewProtocol {
    @IBOutlet weak var tableViewMatchesByDate: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: ScoreViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leagues and Cups"
        activityIndicator.startAnimating()
        addButtons()
        tableViewMatchesByDate.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier: ScoreTableViewCell.key)
        tableViewMatchesByDate.register(UINib(nibName: "DateTableViewCell", bundle: nil), forCellReuseIdentifier: DateTableViewCell.key)
    }
    
    func successGetLeaguesBySeason() {
        tableViewMatchesByDate.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
        }
    }



