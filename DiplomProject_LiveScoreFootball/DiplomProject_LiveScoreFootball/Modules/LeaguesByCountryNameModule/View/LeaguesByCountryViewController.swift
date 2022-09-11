//
//  LeaguesByCountryViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 24.08.22.
//

import UIKit
protocol LeaguesByCountryViewProtocol: AnyObject  {
    func successGetLeagues()
    func failure(error: Error)
}

class LeaguesByCountryViewController: UIViewController, LeaguesByCountryViewProtocol {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var leaguesByCountryTable: UITableView!
    var presenter: LeaguesByCountryViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        leaguesByCountryTable.register(UINib(nibName: "LeaguesByCountryTableViewCell", bundle: nil), forCellReuseIdentifier: LeaguesByCountryTableViewCell.key)
    }

    func successGetLeagues() {
        leaguesByCountryTable.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }

}
