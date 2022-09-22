//
//  AuthorizationViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 14.09.22.
//

import Foundation

protocol AuthorizationViewPresenterProtocol: AnyObject {
    func getRegistrationVC()
    func popToRoot()
}

class AuthorizationViewPresenter: AuthorizationViewPresenterProtocol {
    
    private(set) weak var view: AuthorizationViewProtocol?
    private(set) var router: AuthorizationRouterProtocol?

    required init(view: AuthorizationViewProtocol, router: AuthorizationRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    // Метод полученя экрана регистрации
    func getRegistrationVC() {
        guard let router = router else {
            return
        }
        router.showRegistrationModule()
    }
    
   // Метод получения главного экрана
    func popToRoot() {
        guard let router = router else {
            return
        }
        router.popToRoot()
    }

}
