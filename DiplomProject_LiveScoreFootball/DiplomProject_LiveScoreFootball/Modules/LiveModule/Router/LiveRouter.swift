//
//  LiveRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import Foundation
import UIKit

protocol BaseLiveRouterProtocol {
    var builder: BuilderProtocol? {get}
    var viewController: UIViewController? {get set}
}


protocol LiveRouterProtocol: BaseLiveRouterProtocol {
    func showAuthorizationVC()
}

class LiveRouter: LiveRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    func showAuthorizationVC() {
        guard let authorizationViewController = builder?.createAuthorizationModule(), let liveViewController = viewController?.navigationController else {return}
        liveViewController.pushViewController(authorizationViewController, animated: true)
    }
}
