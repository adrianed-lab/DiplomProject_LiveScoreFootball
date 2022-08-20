//
//  PresenterMainVC.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 12.08.22.
//

import Foundation
import UIKit
import Alamofire

protocol ScoreViewPresenterProtocol: AnyObject {
    func getLeaguesBySeason(season: Int)
    func getLeaguesCount() -> Int
    func scoreTableViewCellConfigure(indexPath: IndexPath, cell: ScoreTableViewCellProtocol)
    var leaguesBySeason: LeaguesByCountryNameOrSeason? {get}
    
}

class ScoreViewPresenter: ScoreViewPresenterProtocol {
    
    weak var view: ScoreViewProtocol?
    var apiProvider: RestAPIProviderProtocol!
    var router: ScoreViewRouterProtocol?
    var leaguesBySeason: LeaguesByCountryNameOrSeason?

    required init(view: ScoreViewProtocol, apiProvider: RestAPIProviderProtocol, router: ScoreViewRouterProtocol) {
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
                    self.view?.successGetLeaguesBySeason()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func getLeaguesCount() -> Int {
        guard let leaguesCount = leaguesBySeason?.response.count else {return 0}
        return leaguesCount
    }
    
    func scoreTableViewCellConfigure(indexPath: IndexPath, cell: ScoreTableViewCellProtocol) {
       guard let leaguesBySeason = leaguesBySeason else {return}
       let leagues = leaguesBySeason.response[indexPath.row]
       guard let codeCountry = leagues.country.code else {return}
       let countryName = leagues.country.name
       let leagueName = leagues.league.name
        cell.configureCell(codeCountry: codeCountry.lowercased(), countryNameInfo: countryName, leagueName: leagueName)
    }
}
