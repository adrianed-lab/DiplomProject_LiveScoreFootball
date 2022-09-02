//
//  StandingRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import Foundation
import UIKit

protocol BaseStandingRouterProtocol {
    var builder: BuilderProtocol? {get set}
    var viewController: UIViewController? {get set}
}


protocol StandingRouterProtocol: BaseLeaguesByCountryRouterProtocol {
    func showTeamInfo(teamId: Int)
}

class StandingRouter: StandingRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showTeamInfo(teamId: Int) {
        guard let teamInfoViewController = builder?.createTeamInfoModule(teamId: teamId), let leaguesViewController = viewController?.navigationController else {return}
            leaguesViewController.pushViewController(teamInfoViewController, animated: true)
    }
}
