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
    func createLeaguesByContryNameModule(nameCountry: String, codeCountry: String) -> UIViewController
    func createTableByLeagueModule(leagueId: Int, countryCode: String) -> UIViewController
    func createTeamInfoModule(teamId: Int, countryCode: String, teamName: String, countryName: String, leagueId: Int) -> UIViewController
    func createMatchEventsModule(fixture: DataMatchesByDate, codeCountry: String) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    
    func createMatchEventsModule(fixture: DataMatchesByDate, codeCountry: String) -> UIViewController {
        let view = MatchEventsViewController()
        let apiProvider = AlamofireAPIProvider()
        let router = MatchEventsRouter(builder: self, viewController: view)
        let presenter = MatchEventsViewPresenter(view: view, apiProvider: apiProvider, router: router, fixture: fixture, codeCountry: codeCountry)
        view.presenter = presenter
        return view
    }
    
    func createTeamInfoModule(teamId: Int, countryCode: String, teamName: String, countryName: String, leagueId: Int) -> UIViewController {
        let view = TeamInfoViewController()
        let apiProvider = AlamofireAPIProvider()
        let router = TeamInfoRouter(builder: self, viewController: view)
        let presenter = TeamInfoViewPresenter(view: view, apiProvider: apiProvider, router: router, teamId: teamId, countryCode: countryCode, teamName: teamName, countryName: countryName, leagueId: leagueId)
        view.presenter = presenter
        return view
    }
    
    func createTableByLeagueModule(leagueId: Int, countryCode: String) -> UIViewController {
        let view = StandingViewController()
        let apiProvider = AlamofireAPIProvider()
        let router = StandingRouter(builder: self, viewController: view)
        let presenter = StandingViewPresenter(view: view, router: router, apiProvider: apiProvider, leagueId: leagueId, countryCode: countryCode)
        view.presenter = presenter
        return view
    }
    
    
    func createLeaguesByContryNameModule(nameCountry: String, codeCountry: String) -> UIViewController {
        let view = LeaguesByCountryViewController()
        let apiProvider = AlamofireAPIProvider()
        let router = LeaguesByCountryRouter(builder: self, viewController: view)
        let presenter = LeaguesByCountryViewPresenter(view: view, router: router, apiProvider: apiProvider, nameCountry: nameCountry, codeCountry: codeCountry)
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
