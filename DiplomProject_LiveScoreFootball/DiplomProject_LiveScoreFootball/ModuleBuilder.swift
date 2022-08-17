//
//  ModuleBuilder.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 16.08.22.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createScoreModule(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    func createScoreModule(router: RouterProtocol) -> UIViewController {
        let view = ScoreViewController()
        let apiProvider = AlamofireAPIProvider()
        let presenter = PresenterScoreView(view: view, apiProvider: apiProvider, router: router)
        view.presenter = presenter
        return view
    }
    
    
}
