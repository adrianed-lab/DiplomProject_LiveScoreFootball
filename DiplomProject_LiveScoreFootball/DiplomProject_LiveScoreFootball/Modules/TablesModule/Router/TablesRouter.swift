//
//  TablesRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 24.08.22.
//

import Foundation
import UIKit

protocol BaseTablesRouter {
    var builder: BuilderProtocol? {get}
    var viewController: UIViewController? {get set}
}

protocol TablesRouterProtocol: BaseTablesRouter {
    func showLeaguesByCountry(countryName: String)
}

class TablesRouter: TablesRouterProtocol {
    
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showLeaguesByCountry(countryName: String) {
        guard let leaguesByCountry = builder?.createLeaguesByContryNameModule(nameCountry: countryName), let tablesViewController = viewController?.navigationController else {return}
            tablesViewController.pushViewController(leaguesByCountry, animated: true)
    }
}
