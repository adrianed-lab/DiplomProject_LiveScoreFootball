//
//  MatchEventsRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import Foundation
import UIKit

protocol BaseMatchEventsRouterProtocol {
    
    var builder: BuilderProtocol? {get set}
    var viewController: UIViewController? {get set}
}


protocol MatchEventsRouterProtocol: BaseTeamInfoRouterProtocol {
    func showStandings()
}

class MatchEventsRouter: MatchEventsRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showStandings() {
           //
    }
}
