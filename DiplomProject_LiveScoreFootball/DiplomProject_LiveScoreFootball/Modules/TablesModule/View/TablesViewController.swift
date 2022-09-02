//
//  TablesViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import UIKit

protocol TablesViewProtocol: AnyObject {
    func successGetCountriesTable()
    func failure(error: Error)
}

class TablesViewController: UIViewController, TablesViewProtocol {
    
    @IBOutlet weak var countriesTableView: UITableView!
    var presenter: TablesViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tables"
        addButtons()
        countriesTableView.register(UINib(nibName: "TablesViewCell", bundle: nil), forCellReuseIdentifier: TablesViewCell.key)
    }
    
    func successGetCountriesTable() {
        countriesTableView.reloadData()
    }
        
    func failure(error: Error) {
        print(error.localizedDescription)
    }

}
