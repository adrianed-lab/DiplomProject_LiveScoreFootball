//
//  StandingViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import UIKit
protocol StandingViewProtocol: AnyObject {
    func successGetStanding()
    func failure(error: Error)
}

class StandingViewController: UIViewController, StandingViewProtocol {
    
    @IBOutlet weak var standingTableView: UITableView!
    var presenter: StandingViewPresenterProtocol!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        standingTableView.register(UINib(nibName: "StandingTableViewCell", bundle: nil), forCellReuseIdentifier: StandingTableViewCell.key)
    }
    
    func successGetStanding() {
        standingTableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }

}
