//
//  ModuleBuilder.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 16.08.22.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createScoreModule(router: ViewsRouterProtocol, title: String, image: UIImage?) -> UIViewController
    func createLiveModule(router: ViewsRouterProtocol, title: String, image: UIImage?) -> UIViewController
    func createFavouritesModule(router: ViewsRouterProtocol, title: String, image: UIImage?) -> UIViewController
    func createTablesModule(router: ViewsRouterProtocol, title: String, image: UIImage?) -> UIViewController

}

class ModuleBuilder: BuilderProtocol {
    func createTablesModule(router: ViewsRouterProtocol, title: String, image: UIImage?) -> UIViewController {
        let view = TablesViewController()
        view.tabBarItem.title = title
        view.tabBarItem.image = image
        let apiProvider = AlamofireAPIProvider()
        let presenter = TablesViewPresenter(view: view, router: router, apiProvider: apiProvider)
        view.presenter = presenter
        return view
    }
    
    
    func createLiveModule(router: ViewsRouterProtocol, title: String, image: UIImage?) -> UIViewController {
        let view = LiveViewController()
        view.tabBarItem.title = title
        view.tabBarItem.image = image
        let apiProvider = AlamofireAPIProvider()
        let presenter = LiveViewPresenter(view: view, router: router, apiProvider: apiProvider)
        view.presenter = presenter
        return view
    }
    
    func createScoreModule(router: ViewsRouterProtocol, title: String, image: UIImage?) -> UIViewController {
        let view = ScoreViewController()
        view.tabBarItem.title = title
        view.tabBarItem.image = image
        let apiProvider = AlamofireAPIProvider()
        let presenter = ScoreViewPresenter(view: view, apiProvider: apiProvider, router: router)
        view.presenter = presenter
        return view
    }
    
    func createFavouritesModule(router: ViewsRouterProtocol, title: String, image: UIImage?) -> UIViewController {
            let view = FavouritesViewController()
            view.tabBarItem.title = title
            view.tabBarItem.image = image
            let presenter = FavouritesViewPresenter(view: view, router: router)
            view.presenter = presenter
            return view
        }
            

    
}
