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

// Класс роутер, который инициализирует модули таббара
class Router: ViewsRouterProtocol {
    
    var navigationTabBarController: UITabBarController?
    var builder: BuilderProtocol?
    
    init(navigationTabBarController: UITabBarController, builder: BuilderProtocol) {
        self.navigationTabBarController = navigationTabBarController
        self.builder = builder
    }
    
// Непосредственно сам метод инициализации
    func initialViewControllers() {
        guard let builder = builder, let navigationController = navigationTabBarController else {return}
        let scoreViewController = UINavigationController(rootViewController: builder.createScoreModule(title: "All Matches", image: UIImage(systemName: "sportscourt")))
        let liveViewController = UINavigationController(rootViewController: builder.createLiveModule(title: "Live", image: UIImage(systemName: "livephoto")))
        let favouritesViewController = UINavigationController(rootViewController: builder.createFavouritesModule(title: "Favourites", image: UIImage(systemName: "star")))
        let tablesViewController = UINavigationController(rootViewController: builder.createTablesModule(title: "Countries", image: UIImage(systemName: "globe")))
            navigationController.viewControllers = [scoreViewController, liveViewController, favouritesViewController, tablesViewController]
    }
}
