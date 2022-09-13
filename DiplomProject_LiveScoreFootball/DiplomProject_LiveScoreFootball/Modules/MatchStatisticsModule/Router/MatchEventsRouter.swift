//
//  MatchEventsRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import Foundation
import UIKit

protocol BaseMatchEventsRouterProtocol {
    
    var builder: BuilderProtocol? {get}
    var viewController: UIViewController? {get set}
}


protocol MatchEventsRouterProtocol: BaseTeamInfoRouterProtocol {
    func showMatchEvent(fixture: DataMatchesByDate, codeCountry: String)
    func showStanding(leagueId: Int, countryCode: String)
    func showTeamInfo(teamId: Int, countryCode: String, teamName: String, countryName: String, leagueId: Int)
}

class MatchEventsRouter: MatchEventsRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showMatchEvent(fixture: DataMatchesByDate, codeCountry: String) {
        guard let matchEventsViewController = builder?.createMatchEventsModule(fixture: fixture, codeCountry: codeCountry), let eventsViewController = viewController?.navigationController else {return}
        eventsViewController.pushViewController(matchEventsViewController, animated: true)
    }
    func showStanding(leagueId: Int, countryCode: String) {
        guard let standingViewController = builder?.createTableByLeagueModule(leagueId: leagueId, countryCode: countryCode), let eventsViewController = viewController?.navigationController else {return}
        eventsViewController.pushViewController(standingViewController, animated: true)
    }
    
    func showTeamInfo(teamId: Int, countryCode: String, teamName: String, countryName: String, leagueId: Int) {
        guard let teamInfoViewController = builder?.createTeamInfoModule(teamId: teamId, countryCode: countryCode, teamName: teamName, countryName: countryName, leagueId: leagueId), let eventsViewController = viewController?.navigationController else {return}
        eventsViewController.pushViewController(teamInfoViewController, animated: true)
    }

}
