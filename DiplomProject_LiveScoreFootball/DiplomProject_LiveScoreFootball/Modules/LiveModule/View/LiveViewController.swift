//
//  LiveViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import UIKit

protocol LiveViewProtocol: AnyObject {
    func successGetLiveMatches()
    func failure(error: Error)
}

class LiveViewController: UIViewController, LiveViewProtocol {
    
    @IBOutlet weak var liveTableView: UITableView!
    var presenter: LiveViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Live"
        liveTableView.register(UINib(nibName: "LiveTableViewCell", bundle: nil), forCellReuseIdentifier: LiveTableViewCell.key)

    }
    
    func successGetLiveMatches() {
        //liveTableView.reloadData()
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
