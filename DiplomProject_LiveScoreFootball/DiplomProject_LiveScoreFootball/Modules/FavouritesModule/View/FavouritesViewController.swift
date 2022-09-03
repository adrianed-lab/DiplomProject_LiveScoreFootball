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
    
    @IBOutlet weak var favouritesTableView: UITableView!
    var presenter: FavouritesViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtons()
        title = "Favourites"
    }
    
    func getObjects() {
        favouritesTableView.reloadData()
        }
}
