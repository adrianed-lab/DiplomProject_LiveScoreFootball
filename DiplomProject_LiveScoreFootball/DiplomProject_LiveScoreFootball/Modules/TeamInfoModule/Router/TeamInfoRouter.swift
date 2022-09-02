//
//  TeamInfoRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 30.08.22.
//

import Foundation
import UIKit

protocol BaseTeamInfoRouterProtocol {
    var builder: BuilderProtocol? {get set}
    var viewController: UIViewController? {get set}
}


protocol TeamInfoRouterProtocol: BaseTeamInfoRouterProtocol {
    func showMatchEvents(fixtureId: Int)
}

class TeamInfoRouter: TeamInfoRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showMatchEvents(fixtureId: Int) {
        guard let matchEventsViewController = builder?.createMatchEventsModule(fixtureId: fixtureId), let teamInfoViewController = viewController?.navigationController else {return}
        teamInfoViewController.pushViewController(matchEventsViewController, animated: true)
    }
}
