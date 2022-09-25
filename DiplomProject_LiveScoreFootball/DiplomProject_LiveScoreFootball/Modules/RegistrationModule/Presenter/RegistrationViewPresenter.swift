//
//  RegistrationViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 14.09.22.
//

import Foundation
import UIKit

protocol RegistrationViewPresenterProtocol: AnyObject {
    func getAuthVC()
}

class RegistrationViewPresenter: RegistrationViewPresenterProtocol {
    
    private(set) weak var view: RegistrationViewProtocol?
    private(set) var router: RegistrationRouterProtocol?
    
    required init(view: RegistrationViewProtocol, router: RegistrationRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func getAuthVC() {
        guard let router = router else {
            return
        }
        router.goToLoginVC()
    }
    
}
