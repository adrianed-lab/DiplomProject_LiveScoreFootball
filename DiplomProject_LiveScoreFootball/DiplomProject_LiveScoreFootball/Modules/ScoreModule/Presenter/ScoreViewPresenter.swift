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
    var router: ViewsRouterProtocol?
    private(set) var leaguesBySeason: LeaguesByCountryNameOrSeason?

    required init(view: ScoreViewProtocol, apiProvider: RestAPIProviderProtocol, router: ViewsRouterProtocol) {
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
        guard let leaguesBySeason = leaguesBySeason?.response[indexPath.row], let codeCountry = leaguesBySeason.country.code else {return}
       let countryName = leaguesBySeason.country.name
       let leagueName = leaguesBySeason.league.name
        cell.configureCell(codeCountry: codeCountry.lowercased(), countryNameInfo: countryName, leagueName: leagueName)
    }
}
