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
    func showStandings()
}

class StandingRouter: StandingRouterProtocol {
   
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
