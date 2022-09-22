//
//  ViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 9.08.22.
//

import UIKit
import SnapKit
import Firebase
import FirebaseAuth

protocol ScoreViewProtocol: AnyObject {
    func successGetLeaguesBySeason()
    func failure(error: Error)
}

class ScoreViewController: UIViewController, ScoreViewProtocol {
    @IBOutlet weak var tableViewMatchesByDate: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var showAuthorizationViewButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .done, target: self, action: #selector(openAuthorizationWindow(_:)))
        button.tintColor = .black
        button.width = 30
        return button
    }
    var presenter: ScoreViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Matches"
        activityIndicator.startAnimating()
        tableViewMatchesByDate.register(UINib(nibName: "ScoreTableViewCell", bundle: nil), forCellReuseIdentifier: ScoreTableViewCell.key)
        tableViewMatchesByDate.register(UINib(nibName: "DateTableViewCell", bundle: nil), forCellReuseIdentifier: DateTableViewCell.key)
        showAuthorizationViewButton.width = 30
        navigationItem.rightBarButtonItem = showAuthorizationViewButton
    }
    
    func successGetLeaguesBySeason() {
        tableViewMatchesByDate.reloadData()
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    @objc func openAuthorizationWindow(_ sender: UIBarButtonItem) {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                let dataBase = Firestore.firestore()
                dataBase.collection("users").getDocuments(completion: { querySnap, error in
                    guard let querySnap = querySnap else {return}
                    let models = querySnap.documents
                    let model = models.first
                    guard let nameData = model?.data() else {return}
                    let keyName = nameData.first { key, value in
                        return key.contains ("firstname")
                    }
                    let keyLastName = nameData.first { key, value in
                        return key.contains ("lastname")
                    }
                    guard let lastName = keyLastName?.value as? String else {return}
                    guard let name = keyName?.value as? String else {return}
                    self.presenter.showLogOutVC(firstName: name, lastName: lastName)
                })
            } else {
                self.presenter.getAuthorizationVC()
            }
        }
    }
}



