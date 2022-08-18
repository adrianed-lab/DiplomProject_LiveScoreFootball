//
//  PresenterMainVC.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 12.08.22.
//

import Foundation
import UIKit
import Alamofire

protocol PresenterScoreViewProtocol: AnyObject {
    init(view: ScoreViewProtocol, apiProvider: RestAPIProviderProtocol, router: RouterProtocol)
    func getLeaguesBySeason(season: Int)
    var leaguesBySeason: LeaguesByCountryName? {get set}
}

class PresenterScoreView: PresenterScoreViewProtocol {

    weak var view: ScoreViewProtocol?
    var apiProvider: RestAPIProviderProtocol!
    var router: RouterProtocol?
    var leaguesBySeason: LeaguesByCountryName?

    required init(view: ScoreViewProtocol, apiProvider: RestAPIProviderProtocol, router: RouterProtocol) {
        self.view = view
        self.apiProvider = apiProvider
        self.router = router
        getLeaguesBySeason(season: 2022)
    }

    func getLeaguesBySeason(season: Int) {
        apiProvider.getLeaguesBySeason(seasonYear: season) { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.leaguesBySeason = value
                    self.view?.successGetMatchesByDate()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    
    
    
    
}

}
