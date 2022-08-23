//
//  Router.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 16.08.22.
//

import Foundation
import UIKit
protocol BaseRouter {
    var navigationController: UITabBarController? {get set}
    var builder: BuilderProtocol? {get set}
}

protocol ViewsRouterProtocol: BaseRouter {
    func initialViewControllers()
}

class Router: ViewsRouterProtocol {
    
    var navigationController: UITabBarController?
    var builder: BuilderProtocol?
    
    init(navigationController: UITabBarController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialViewControllers() {
        if let navigationController = navigationController {
            guard let scoreViewController = builder?.createScoreModule(router: self, title: "Leagues and Cups", image: UIImage(systemName: "sportscourt")), let liveViewController = builder?.createLiveModule(router: self, title: "Live", image: UIImage(systemName: "livephoto")), let favouritesViewController = builder?.createFavouritesModule(router: self, title: "Favourites", image: UIImage(systemName: "star")), let tablesViewController = builder?.createTablesModule(router: self, title: "Tables", image: UIImage(systemName: "tablecells")) else {return}
            navigationController.viewControllers = [UINavigationController(rootViewController: scoreViewController), UINavigationController(rootViewController: liveViewController), UINavigationController(rootViewController: favouritesViewController), UINavigationController(rootViewController: tablesViewController)]
        }
    }
    
    
    
    
}
