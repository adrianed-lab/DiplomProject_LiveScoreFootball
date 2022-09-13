//
//  StandingViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.08.22.
//

import Foundation
import UIKit

protocol StandingViewPresenterProtocol: AnyObject {
    func getStandingByLeagueId(leagueId: Int)
    func configureCell(indexPath: IndexPath, cell: StandingTableViewCellProtocol)
    func configureStandingCollectionViewCell(indexPath: IndexPath, cell: StandingCollectionViewCellProtocol)
    func configureLastMatchesCell(indexPath: IndexPath, cell: LastFixturesByLeagueTableViewCellProtocol)
    func configureFutureMatchesByLeague(indexPath: IndexPath, cell: FutureTeamInfoTableViewCellProtocol)
    func popToRootVC()
    func countFutureMatches() -> Int
    func countLastFixturesByLeague() -> Int
    func countStandings() -> Int
    func countCollectionItem() -> Int
    func createView()    
    func getFixture(indexPath: IndexPath)
    func getCollectionItemIndex(indexPath: IndexPath)
    func getTeamId(indexPath: IndexPath)
    var lastMatchesByLeagueId: MatchesByDate? {get}
    var futureMatchesByLeagueId: MatchesByDate? {get}
    var leagueTable: LeagueTable? {get}
}

class StandingViewPresenter: StandingViewPresenterProtocol {
    
    
    private(set) weak var view: StandingViewProtocol?
    private(set) var router: StandingRouterProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var leagueTable: LeagueTable?
    private(set) var lastMatchesByLeagueId: MatchesByDate?
    private(set) var futureMatchesByLeagueId: MatchesByDate?
    private(set) var leagueId: Int
    private(set) var countryCode: String?
    var collectionCellItems: [CollectionModel] = [CollectionModel(name: "TABLE"), CollectionModel(name: "RESULTS"), CollectionModel(name: "CALENDAR")]

    required init(view: StandingViewProtocol, router: StandingRouterProtocol, apiProvider: RestAPIProviderProtocol, leagueId: Int, countryCode: String) {
        self.view = view
        self.router = router
        self.apiProvider = apiProvider
        self.leagueId = leagueId
        self.countryCode = countryCode
        getStandingByLeagueId(leagueId: leagueId)
    }
    
    func getStandingByLeagueId(leagueId: Int) {
        apiProvider.getLeagueTable(seasonYear: 2022, leagueId: leagueId) { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    if value.response.isEmpty {
                        view.showAllertMessage()
                    }
                    self.leagueTable = value
                    view.successGetStanding()
                case .failure(let error):
                    view.failure(error: error)
                }
            }
        }
    }
    
    func getCollectionItemIndex(indexPath: IndexPath) {
        if indexPath.row == 0 {
            apiProvider.getLeagueTable(seasonYear: 2022, leagueId: leagueId) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.leagueTable = value
                        view.successGetStanding()
                    case .failure(let error):
                        view.failure(error: error)
                    }
                }
            }
        } else if indexPath.row == 1 {
            apiProvider.getMatchesByLeague(seasonYear: 2022, leagueId: leagueId, last: 30, timeZone: "Europe/Minsk") { [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.lastMatchesByLeagueId = value
                        view.successGetStanding()
                    case .failure(let error):
                        view.failure(error: error)
                    }
                }
            }
        } else if indexPath.row == 2 {
            apiProvider.getFutureMatchesByLeague(seasonYear: 2022, leagueId: leagueId, next: 30, timeZone: "Europe/Minsk"){ [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.futureMatchesByLeagueId = value
                        view.successGetStanding()
                    case .failure(let error):
                        view.failure(error: error)
                    }
                }
            }
        }
    }

    func countStandings() -> Int {
        leagueTable?.response.first?.league.standings.first?.count ?? 0
    }
    
    func countFutureMatches() -> Int {
        futureMatchesByLeagueId?.response.count ?? 0
    }
    
    func countLastFixturesByLeague() -> Int {
        lastMatchesByLeagueId?.response.count ?? 0
    }
    
    func countCollectionItem() -> Int {
        collectionCellItems.count
    }
    
    func configureFutureMatchesByLeague(indexPath: IndexPath, cell: FutureTeamInfoTableViewCellProtocol) {
        guard let matches = futureMatchesByLeagueId?.response[indexPath.row] else {return}
        let dateMatch = matches.fixture.date ?? ""
        let logoFirstTeam = matches.teams.home.id
        let logoSecondTeam = matches.teams.away.id
        let nameFirstTeam = matches.teams.home.name
        let nameSecondTeam = matches.teams.away.name
        cell.configureCell(matchDate: dateMatch.getDate(.shortDate), firstTeamLogo: logoFirstTeam, secondTeamLogo: logoSecondTeam, firstTeamName: nameFirstTeam, secondTeamName: nameSecondTeam, matchStart: dateMatch.getDate(.startTime))
    }

    
    func configureLastMatchesCell(indexPath: IndexPath, cell: LastFixturesByLeagueTableViewCellProtocol) {
        guard let lastMatches = lastMatchesByLeagueId?.response[indexPath.row] else {return}
        let matchDate = lastMatches.fixture.date ?? ""
        let logoFirstTeam = lastMatches.teams.home.id
        let logoSecondTeam = lastMatches.teams.away.id
        let nameHomeTeam = lastMatches.teams.home.name
        let nameAwayTeam = lastMatches.teams.away.name
        let goalsHome = lastMatches.goals.home ?? 0
        let goalsAway = lastMatches.goals.away ?? 0
        cell.configureCell(date: matchDate.getDate(.shortDate), lofoFirstTeam: logoFirstTeam, logoSecondTeam: logoSecondTeam, nameFirstTeam: nameHomeTeam, nameSecondTeam: nameAwayTeam, goalsHome: goalsHome, goalsAway: goalsAway)
    }
        
    func configureCell(indexPath: IndexPath, cell: StandingTableViewCellProtocol) {
        guard let standings = leagueTable?.response.first?.league.standings.first?[indexPath.row], let playedGames = standings.all.played, let goalsFor = standings.all.goals.goalsFor, let goalsAgainst = standings.all.goals.against else {return}
        let teamRank = standings.rank
        let teamLogo = standings.team.id ?? 1
        let teamName = standings.team.name
        let points = standings.points
        cell.configureCell(rank: teamRank, teamLogo: teamLogo, teamName: teamName, games: playedGames, goalsFor: goalsFor, goalsAgainst: goalsAgainst, points: points)
    }
    
    func configureStandingCollectionViewCell(indexPath: IndexPath, cell: StandingCollectionViewCellProtocol) {
        let collectionItemName = collectionCellItems[indexPath.row].name
        cell.configureCell(item: collectionItemName)
    }

    
    func getTeamId(indexPath: IndexPath) {
        guard let standings = leagueTable?.response.first?.league.standings.first?[indexPath.row], let countryName = leagueTable?.response.first?.league.country,  let router = router, let countryCode = countryCode else {return}
        let teamId = standings.team.id ?? 1
        let teamName = standings.team.name
        router.showTeamInfo(teamId: teamId, countryCode: countryCode, teamName: teamName, countryName: countryName, leagueId: leagueId)
    }
    
    func getFixture(indexPath: IndexPath) {
        guard let match = lastMatchesByLeagueId?.response[indexPath.row], let router = router, let flag = match.league.flag else {return}
        router.showFixtureInfo(fixture: match, codeCountry: flag)
    }
    
    func popToRootVC() {
        guard let router = router else {return}
        router.popToRoot()
    }

    func createView() {
        guard let countryCode = countryCode, let countryName = leagueTable?.response.first?.league.country, let leagueId = leagueTable?.response.first?.league.id, let leagueName = leagueTable?.response.first?.league.name, let view = view else {return}
        view.configureView(flag: countryCode, countryName: countryName, leagueId: leagueId, leagueName: leagueName)
    }
}
