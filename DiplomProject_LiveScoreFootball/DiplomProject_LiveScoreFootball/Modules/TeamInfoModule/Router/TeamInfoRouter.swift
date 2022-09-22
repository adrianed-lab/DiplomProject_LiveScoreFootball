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
    func showMatchEvents(fixture: DataMatchesByDate, codeCountry: String)
}

class TeamInfoRouter: TeamInfoRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    // Метод перехода на экран Events
    func showMatchEvents(fixture: DataMatchesByDate, codeCountry: String) {
        guard let matchEventsViewController = builder?.createMatchEventsModule(fixture: fixture, codeCountry: codeCountry), let teamInfoViewController = viewController?.navigationController else {return}
        teamInfoViewController.pushViewController(matchEventsViewController, animated: true)
    }
}
