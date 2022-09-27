//
//  FavouritesViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import UIKit

protocol FavouritesViewProtocol: AnyObject {
    func getObjects()
    
}

class FavouritesViewController: UIViewController, FavouritesViewProtocol {
    
    @IBOutlet weak var viewForEmtyFavoritesModule: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favouritesTableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    var presenter: FavouritesViewPresenterProtocol!
    var showFavouritesTeamsButton: UIBarButtonItem {
        let button = UIBarButtonItem(image: UIImage(systemName: "list.star"), style: .done, target: self, action: #selector(openFavouritesTeams(_:)))
        button.tintColor = .black
        button.width = 30
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        navigationItem.rightBarButtonItem = showFavouritesTeamsButton
        messageLabel.text = "There are currently no featured teams events"
    }
    
    func getObjects() {
        favouritesTableView.reloadData()
    }
    
    @objc func openFavouritesTeams(_ sender: UIBarButtonItem) {
        // Будет реализовано открытие окна со списком избранных команд
    }
}
