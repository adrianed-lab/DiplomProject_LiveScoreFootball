//
//  ModuleBuilder.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 16.08.22.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createScoreModule(title: String, image: UIImage?) -> UIViewController
    func createLiveModule(title: String, image: UIImage?) -> UIViewController
    func createFavouritesModule(title: String, image: UIImage?) -> UIViewController
    func createTablesModule(title: String, image: UIImage?) -> UIViewController
    func createLeaguesByContryNameModule(nameCountry: String) -> UIViewController
    func createTableByLeagueModule(leagueId: Int) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    func createTableByLeagueModule(leagueId: Int) -> UIViewController {
        let view = StandingViewController()
        let apiProvider = AlamofireAPIProvider()
        let router = StandingRouter(builder: self, viewController: view)
        let presenter = StandingViewPresenter(view: view, router: router, apiProvider: apiProvider, leagueId: leagueId)
        view.presenter = presenter
        return view
    }
    
    
    func createLeaguesByContryNameModule(nameCountry: String) -> UIViewController {
        let view = LeaguesByCountryViewController()
        let apiProvider = AlamofireAPIProvider()
        let router = LeaguesByCountryRouter(builder: self, viewController: view)
        let presenter = LeaguesByCountryViewPresenter(view: view, router: router, apiProvider: apiProvider, nameCountry: nameCountry)
        view.presenter = presenter
        return view
    }
    
    func createTablesModule(title: String, image: UIImage?) -> UIViewController {
        let view = TablesViewController()
        view.tabBarItem.title = title
        view.tabBarItem.image = image
        let apiProvider = AlamofireAPIProvider()
        let router = TablesRouter(builder: self, viewController: view)
        let presenter = TablesViewPresenter(view: view, router: router, apiProvider: apiProvider)
        view.presenter = presenter
        return view
    }
    
    
    func createLiveModule(title: String, image: UIImage?) -> UIViewController {
        let view = LiveViewController()
        view.tabBarItem.title = title
        view.tabBarItem.image = image
        let apiProvider = AlamofireAPIProvider()
        let router = LiveRouter(builder: self, viewController: view)
        let presenter = LiveViewPresenter(view: view, router: router, apiProvider: apiProvider)
        view.presenter = presenter
        return view
    }
    
    func createScoreModule(title: String, image: UIImage?) -> UIViewController {
        let view = ScoreViewController()
        view.tabBarItem.title = title
        view.tabBarItem.image = image
        let apiProvider = AlamofireAPIProvider()
        let router = ScoreRouter(builder: self, viewController: view)
        let presenter = ScoreViewPresenter(view: view, apiProvider: apiProvider, router: router)
        view.presenter = presenter
        return view
    }
    
    func createFavouritesModule(title: String, image: UIImage?) -> UIViewController {
            let view = FavouritesViewController()
            view.tabBarItem.title = title
            view.tabBarItem.image = image
            let router = FavouritesRouter(builder: self, viewController: view)
            let presenter = FavouritesViewPresenter(view: view, router: router)
            view.presenter = presenter
            return view
        }
            

    
}
