//
//  Router.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 16.08.22.
//

import Foundation
import UIKit
protocol BaseRouter {
    var navigationController: UINavigationController? {get set}
    var builder: BuilderProtocol? {get set}
}

protocol ScoreViewRouterProtocol: BaseRouter {
    func initialViewController()
}

class Router: ScoreViewRouterProtocol {
    
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let scoreViewController = builder?.createScoreModule(router: self) else {return}
            navigationController.viewControllers = [scoreViewController]
        }
    }
    
    
    
    
}
