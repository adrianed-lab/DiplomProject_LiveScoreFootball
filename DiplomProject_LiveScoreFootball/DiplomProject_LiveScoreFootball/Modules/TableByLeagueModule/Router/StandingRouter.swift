//
//  StandingRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import Foundation
import UIKit

protocol BaseStandingRouterProtocol {
    var builder: BuilderProtocol? {get}
    var viewController: UIViewController? {get set}
}


protocol StandingRouterProtocol: BaseLeaguesByCountryRouterProtocol {
    func showTeamInfo(teamId: Int, countryCode: String, teamName: String, countryName: String, leagueId: Int)
    func showFixtureInfo(fixture: DataMatchesByDate)
}

class StandingRouter: StandingRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showTeamInfo(teamId: Int, countryCode: String, teamName: String, countryName: String, leagueId: Int) {
        guard let teamInfoViewController = builder?.createTeamInfoModule(teamId: teamId, countryCode: countryCode, teamName: teamName, countryName: countryName, leagueId: leagueId), let leaguesViewController = viewController?.navigationController else {return}
            leaguesViewController.pushViewController(teamInfoViewController, animated: true)
    }
    func showFixtureInfo(fixture: DataMatchesByDate) {
        guard let matchEventsViewController = builder?.createMatchEventsModule(fixture: fixture), let standingViewController = viewController?.navigationController else {return}
        standingViewController.pushViewController(matchEventsViewController, animated: true)
    }
}
