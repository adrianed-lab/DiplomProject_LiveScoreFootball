//
//  FavouritesViewPresenterProtocol.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import Foundation

protocol FavouritesViewPresenterProtocol: AnyObject {
    func getFavouritesTeam()
}

class FavouritesViewPresenter: FavouritesViewPresenterProtocol {
    
    private(set) weak var view: FavouritesViewProtocol!
    private(set) var router: FavouritesRouterProtocol?
    
    required init(view: FavouritesViewProtocol, router: FavouritesRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
    func getFavouritesTeam() {
        // В будущем будет реализовано получение списка событих избранных команд
    }
}
