//
//  ModuleBuilder.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 16.08.22.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createScoreModule(router: ScoreViewRouterProtocol) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    func createScoreModule(router: ScoreViewRouterProtocol) -> UIViewController {
        let view = ScoreViewController()
        let apiProvider = AlamofireAPIProvider()
        let presenter = ScoreViewPresenter(view: view, apiProvider: apiProvider, router: router)
        view.presenter = presenter
        return view
    }
    
    
}
