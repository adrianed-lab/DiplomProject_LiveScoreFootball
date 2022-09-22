//
//  LogOutViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 15.09.22.
//

import Foundation

protocol LogOutViewPresenterProtocol: AnyObject {
    func getAuthVC()
    func configure()
}

class LogOutViewPresenter: LogOutViewPresenterProtocol {
    
    private(set) var view: LogOutViewControllerProtocol?
    private(set) var lastName: String
    private(set) var firstName: String
    private(set) var router: LogOutRouterProtocol?
    
    required init(view: LogOutViewControllerProtocol, lastName: String, firstName: String, router: LogOutRouterProtocol) {
        self.view = view
        self.lastName = lastName
        self.firstName = firstName
        self.router = router
    }
    // Метод получение данных LoginVC для последующего вызова его во View
    func getAuthVC() {
        guard let router = router else {return}
        router.goToLoginVC()
    }
    // Метод конфигурирования label
    func configure() {
        guard let view = view else {return}
        view.configureLable(firstName: firstName, lastName: lastName)
    }
}
