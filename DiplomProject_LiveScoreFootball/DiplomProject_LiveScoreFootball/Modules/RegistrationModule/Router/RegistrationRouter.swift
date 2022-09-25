//
//  RegistrationRouter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 14.09.22.
//

import Foundation
import UIKit

protocol BaseRegistrationRouterProtocol {
    
    var builder: BuilderProtocol? {get}
    var viewController: UIViewController? {get set}
}


protocol RegistrationRouterProtocol: BaseRegistrationRouterProtocol {
    func goToLoginVC()
}

class RegistrationRouter: RegistrationRouterProtocol {
   
    var builder: BuilderProtocol?
    var viewController: UIViewController?
    
    init(builder: BuilderProtocol, viewController: UIViewController) {
        self.builder = builder
        self.viewController = viewController
    }
    // Метод перехода на экран LoginVC
    func goToLoginVC() {
        guard let authorizationViewController = builder?.createAuthorizationModule(), let registrationViewController = viewController?.navigationController else {return}
        registrationViewController.pushViewController(authorizationViewController, animated: true)
    }

}
