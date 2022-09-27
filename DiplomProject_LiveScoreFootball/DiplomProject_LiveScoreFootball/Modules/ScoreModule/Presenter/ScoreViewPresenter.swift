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
    func getAuthorizationVC()
    func getFixtureItem(indexPath: IndexPath)
    func showLogOutVC(firstName: String, lastName: String)
    func scoreTableViewCellConfigure(indexPath: IndexPath, cell: ScoreTableViewCellProtocol)
    var matchesByDate: MatchesByDate? {get}
    
}

class ScoreViewPresenter: ScoreViewPresenterProtocol {
    
    private(set) weak var view: ScoreViewProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var router: ScoreRouterProtocol?
    private(set) var matchesByDate: MatchesByDate?

    required init(view: ScoreViewProtocol, apiProvider: RestAPIProviderProtocol, router: ScoreRouterProtocol) {
        self.view = view
        self.apiProvider = apiProvider
        self.router = router
        getFixturesByDate(date: DateStruct.currentDate)
    }
    
    // Получение матчей по дате
    func getFixturesByDate(date: String) {
        apiProvider.getMatchesByDate(date: date, timeZone: "Europe/Minsk") { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.matchesByDate = value
                    self.view?.successGetLeaguesBySeason()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    // Колчество матчей по дате
    func getLeaguesCount() -> Int {
        matchesByDate?.response.count ?? 0
    }
    
    // Получение данных для сборки ячейки
    func scoreTableViewCellConfigure(indexPath: IndexPath, cell: ScoreTableViewCellProtocol) {
        guard let lastMatches = matchesByDate?.response[indexPath.row] else {return}
        let matchDate = lastMatches.fixture.date ?? ""
        let logoFirstTeam = lastMatches.teams.home.id
        let logoSecondTeam = lastMatches.teams.away.id
        let nameHomeTeam = lastMatches.teams.home.name
        let nameAwayTeam = lastMatches.teams.away.name
        let goalsHome = lastMatches.goals.home ?? 0
        let goalsAway = lastMatches.goals.away ?? 0
        cell.configureCell(date: matchDate.getDate(.startTime), lofoFirstTeam: logoFirstTeam, logoSecondTeam: logoSecondTeam, nameFirstTeam: nameHomeTeam, nameSecondTeam: nameAwayTeam, goalsHome: goalsHome, goalsAway: goalsAway)
    }
    
    func getFixtureItem(indexPath: IndexPath) {
        guard let fixture = matchesByDate?.response[indexPath.row], let router = router, let flag = fixture.league.flag else {return}
        router.showMatchEvent(fixture: fixture, codeCountry: flag)
    }
    
    func getAuthorizationVC() {
        guard let router = router else {return}
        router.showAuthorizationVC()
    }
    
    func showLogOutVC(firstName: String, lastName: String) {
        guard let router = router else {
            return
        }
        router.showLogOut(firstName: firstName, lastName: lastName)
    }


}
