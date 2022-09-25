//
//  TablesViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import UIKit

protocol TablesViewProtocol: AnyObject {
    func failure(error: Error)
}

class TablesViewController: UIViewController, TablesViewProtocol {
    
    @IBOutlet weak var countriesTableView: UITableView!
    var presenter: TablesViewPresenterProtocol!
    var showAuthorizationViewButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .done, target: self, action: #selector(openAuthorizationWindow(_:)))
        button.tintColor = .black
        button.width = 30
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        countriesTableView.register(UINib(nibName: "TablesViewCell", bundle: nil), forCellReuseIdentifier: TablesViewCell.key)
        navigationItem.rightBarButtonItem = showAuthorizationViewButton

    }
    
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    @objc func openAuthorizationWindow(_ sender: UIBarButtonItem) {
        presenter.getAuthorizationVC()
    }
}
