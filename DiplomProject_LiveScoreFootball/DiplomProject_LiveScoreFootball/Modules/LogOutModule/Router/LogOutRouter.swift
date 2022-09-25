//
//  LogOutRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 15.09.22.
//

import Foundation

import UIKit

protocol BaseLogOutRouterProtocol {
    
    var builder: BuilderProtocol? {get}
    var viewController: UIViewController? {get set}
}


protocol LogOutRouterProtocol: BaseLogOutRouterProtocol {
    func goToLoginVC()
}

class LogOutRouter: LogOutRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    // Метод роутера для перехода на экран LoginVC
    func goToLoginVC() {
        guard let authorizationViewController = builder?.createAuthorizationModule(), let logOutVC = viewController?.navigationController else {return}
        logOutVC.pushViewController(authorizationViewController, animated: true)
    }

}
