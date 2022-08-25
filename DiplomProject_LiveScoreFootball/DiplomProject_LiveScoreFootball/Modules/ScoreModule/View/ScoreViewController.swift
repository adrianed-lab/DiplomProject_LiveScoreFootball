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
    var presenter: ScoreViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leagues and Cups"
        
        tableViewMatchesByDate.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier: ScoreTableViewCell.key)
    }
    
    func successGetLeaguesBySeason() {
        tableViewMatchesByDate.reloadData()
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
        }
    }



