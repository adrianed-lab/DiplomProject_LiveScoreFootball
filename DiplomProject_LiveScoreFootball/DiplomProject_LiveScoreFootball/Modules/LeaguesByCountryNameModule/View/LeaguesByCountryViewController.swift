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
    
    @IBOutlet weak var leaguesByCountryTable: UITableView!
    var presenter: LeaguesByCountryViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaguesByCountryTable.register(UINib(nibName: "LeaguesByCountryTableViewCell", bundle: nil), forCellReuseIdentifier: LeaguesByCountryTableViewCell.key)
    }

    func successGetLeagues() {
        leaguesByCountryTable.reloadData()
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }

}
