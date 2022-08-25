//
//  Router.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 16.08.22.
//

import Foundation
import UIKit

protocol BaseRouter {
    var navigationTabBarController: UITabBarController? {get set}
    var builder: BuilderProtocol? {get set}
}

protocol ViewsRouterProtocol: BaseRouter {
    func initialViewControllers()
}

class Router: ViewsRouterProtocol {
    
    var navigationTabBarController: UITabBarController?
    var builder: BuilderProtocol?
    
    init(navigationTabBarController: UITabBarController, builder: BuilderProtocol) {
        self.navigationTabBarController = navigationTabBarController
        self.builder = builder
    }
    
    func initialViewControllers() {
        if let navigationController = navigationTabBarController {
            guard let scoreViewController = builder?.createScoreModule(title: "Leagues and Cups", image: UIImage(systemName: "sportscourt")), let liveViewController = builder?.createLiveModule(title: "Live", image: UIImage(systemName: "livephoto")), let favouritesViewController = builder?.createFavouritesModule(title: "Favourites", image: UIImage(systemName: "star")), let tablesViewController = builder?.createTablesModule(title: "Tables", image: UIImage(systemName: "tablecells")) else {return}
            navigationController.viewControllers = [UINavigationController(rootViewController: scoreViewController), UINavigationController(rootViewController: liveViewController), UINavigationController(rootViewController: favouritesViewController), UINavigationController(rootViewController: tablesViewController)]
        }
        
    }
}
