//
//  LeaguesByCountryRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 24.08.22.
//

import Foundation
import UIKit

protocol BaseLeaguesByCountryRouterProtocol {
    var builder: BuilderProtocol? {get set}
    var viewController: UIViewController? {get set}
}


protocol LeaguesByCountryRouterProtocol: BaseLeaguesByCountryRouterProtocol {
    func showStandings(leagueId: Int)
}

class LeaguesByCountryRouter: LeaguesByCountryRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showStandings(leagueId: Int) {
        guard let standingViewController = builder?.createTableByLeagueModule(leagueId: leagueId), let leaguesViewController = viewController?.navigationController else {return}
            leaguesViewController.pushViewController(standingViewController, animated: true)
    }
}
