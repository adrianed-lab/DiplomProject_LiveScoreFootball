//
//  ViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 9.08.22.
//

import UIKit

protocol ScoreViewProtocol: AnyObject {
    func successGetMatchesByDate()
    func failure(error: Error)
}

class ScoreViewController: UIViewController {
    @IBOutlet weak var tableViewMatchesByDate: UITableView!
    var presenter: PresenterScoreViewProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewMatchesByDate.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier: ScoreTableViewCell.key)
    }


}


