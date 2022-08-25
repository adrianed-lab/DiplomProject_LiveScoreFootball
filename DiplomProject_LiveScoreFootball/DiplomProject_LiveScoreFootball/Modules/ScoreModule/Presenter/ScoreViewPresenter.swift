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
    func getFixturesByDate(date: String)
    func getLeaguesCount() -> Int
    func scoreTableViewCellConfigure(indexPath: IndexPath, cell: ScoreTableViewCellProtocol)
    var leaguesByDate: MatchesByDate? {get}
    
}

class ScoreViewPresenter: ScoreViewPresenterProtocol {
    
    weak var view: ScoreViewProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var router: ScoreRouterProtocol?
    private(set) var leaguesByDate: MatchesByDate?

    required init(view: ScoreViewProtocol, apiProvider: RestAPIProviderProtocol, router: ScoreRouterProtocol) {
        self.view = view
        self.apiProvider = apiProvider
        self.router = router
        getFixturesByDate(date: Constants.currentDate)
    }

    func getFixturesByDate(date: String) {
        apiProvider.getMatchesByDate(date: date) { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.leaguesByDate = value
                    self.view?.successGetLeaguesBySeason()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func getLeaguesCount() -> Int {
        let leaguesCount = leaguesByDate?.response.count ?? 0
        return leaguesCount
    }
    
    func scoreTableViewCellConfigure(indexPath: IndexPath, cell: ScoreTableViewCellProtocol) {
        guard let leaguesBySeason = leaguesByDate?.response[indexPath.row], let flagCountry = leaguesBySeason.league.flag else {return}
        let countryName = leaguesBySeason.league.country
        let leagueName = leaguesBySeason.league.name
        cell.configureCell(codeCountry: flagCountry, countryNameInfo: countryName, leagueName: leagueName)
    }
}
