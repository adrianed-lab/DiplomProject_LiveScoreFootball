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
    var viewController: UIViewController? {get}
}


protocol TeamInfoRouterProtocol: BaseTeamInfoRouterProtocol {
    func showMatchEvents(fixture: DataMatchesByDate)
}

class TeamInfoRouter: TeamInfoRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showMatchEvents(fixture: DataMatchesByDate) {
        guard let matchEventsViewController = builder?.createMatchEventsModule(fixture: fixture), let teamInfoViewController = viewController?.navigationController else {return}
        teamInfoViewController.pushViewController(matchEventsViewController, animated: true)
    }
}
