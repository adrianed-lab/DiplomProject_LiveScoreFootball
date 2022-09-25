//
//  AuthorizationRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 14.09.22.
//

import Foundation
import UIKit

protocol BaseAuthorizationRouterProtocol {
    
    var builder: BuilderProtocol? {get}
    var viewController: UIViewController? {get set}
}


protocol AuthorizationRouterProtocol: BaseAuthorizationRouterProtocol {
    func showRegistrationModule()
    func showLogOutVC(firstName: String, lastName: String)
    func popToRoot()
    
}

class AuthorizationRouter: AuthorizationRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    
    // Методы переходов на нужный нам экран
    func showRegistrationModule() {
        guard let registrationViewController = builder?.createRegistrationModule(), let authorizationViewController = viewController?.navigationController else {return}
        authorizationViewController.pushViewController(registrationViewController, animated: true)
    }
    
    func showLogOutVC(firstName: String, lastName: String) {
        guard let logOutVC = builder?.createLogOutModule(firstName: firstName, lastName: lastName), let authorizationViewController = viewController?.navigationController else {return}
        authorizationViewController.pushViewController(logOutVC, animated: true)
    }
    
    func popToRoot() {
        guard let authorizationViewController = viewController?.navigationController else {return}
        authorizationViewController.popToRootViewController(animated: true)
    }

    
}
