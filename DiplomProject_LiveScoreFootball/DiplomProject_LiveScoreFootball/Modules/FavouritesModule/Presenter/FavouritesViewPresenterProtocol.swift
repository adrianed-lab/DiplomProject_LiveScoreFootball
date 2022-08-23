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
    
    weak var view: FavouritesViewProtocol!
    var router: ViewsRouterProtocol?
    
    required init(view: FavouritesViewProtocol, router: ViewsRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
    func getFavouritesTeam() {
            //
        }
}
