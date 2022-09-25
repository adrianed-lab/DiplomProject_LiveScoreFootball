//
//  ScoreRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import Foundation
import UIKit

protocol BaseScoreRouterProtocol {
    var builder: BuilderProtocol? {get}
    var viewController: UIViewController? {get set}
}


protocol ScoreRouterProtocol: BaseScoreRouterProtocol {
    func showMatchEvent(fixture: DataMatchesByDate, codeCountry: String)
    func showAuthorizationVC()
    func showLogOut(firstName: String, lastName: String)
}

class ScoreRouter: ScoreRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showMatchEvent(fixture: DataMatchesByDate, codeCountry: String) {
        guard let matchEventsViewController = builder?.createMatchEventsModule(fixture: fixture, codeCountry: codeCountry), let scoreViewController = viewController?.navigationController else {return}
        scoreViewController.pushViewController(matchEventsViewController, animated: true)
    }
    func showAuthorizationVC() {
        guard let authorizationViewController = builder?.createAuthorizationModule(), let scoreViewController = viewController?.navigationController else {return}
        scoreViewController.pushViewController(authorizationViewController, animated: true)
    }
    
    func showLogOut(firstName: String, lastName: String) {
        guard let authorizationViewController = builder?.createLogOutModule(firstName: firstName, lastName: lastName), let scoreViewController = viewController?.navigationController else {return}
        scoreViewController.pushViewController(authorizationViewController, animated: true)
    }


}
