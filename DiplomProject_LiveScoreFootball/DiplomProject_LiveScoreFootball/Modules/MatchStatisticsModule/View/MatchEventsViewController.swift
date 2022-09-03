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
}

class MatchEventsViewController: UIViewController, MatchEventsViewProtocol {
    
    @IBOutlet weak var matchEventsTableView: UITableView!
    @IBOutlet weak var matchEventsCollectionView: UICollectionView!
    var presenter: MatchEventsViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matchEventsTableView.register(UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: EventsTableViewCell.key)
        matchEventsCollectionView.register(UINib(nibName: "EventsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: EventsCollectionViewCell.key)
    }
    
    func successGetEvents() {
        matchEventsTableView.reloadData()
    }
    
    func failureGetEvents(error: Error) {
        print(error.localizedDescription)
    }


}
