//
//  LiveViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import UIKit

protocol LiveViewProtocol: AnyObject {
    func failure(error: Error)
}

class LiveViewController: UIViewController, LiveViewProtocol {
    
    @IBOutlet weak var liveTableView: UITableView!
    var presenter: LiveViewPresenterProtocol!
    var showAuthorizationViewButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .done, target: self, action: #selector(openAuthorizationWindow(_:)))
        button.tintColor = .black
        button.width = 30

        return button
    }
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Live"
        liveTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        liveTableView.register(UINib(nibName: "LiveTableViewCell", bundle: nil), forCellReuseIdentifier: LiveTableViewCell.key)
        showAuthorizationViewButton.width = 30
        navigationItem.rightBarButtonItem = showAuthorizationViewButton

    }

    // Повторный запрос на получение лайв данных
    @objc func refreshData(_ sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.presenter.getLiveMatches(live: "all")
            self.liveTableView.reloadData()
            sender.endRefreshing()
        }
       
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    // Переход на экран авторизации
    @objc func openAuthorizationWindow(_ sender: UIBarButtonItem) {
        presenter.getAuthorizationVC()
    }
}
