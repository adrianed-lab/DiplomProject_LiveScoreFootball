//
//  TeamInfoViewPresenterProtocol.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 30.08.22.
//

import Foundation

protocol TeamInfoViewPresenterProtocol: AnyObject {
    func getTeamInfo(teamId: Int)
    func configureTableCell(indexPath: IndexPath, cell: TeamInfoTableViewCellProtocol)
    func configureCollectionViewCell(indexPath: IndexPath, cell: TeamInfoCollectionViewCellProtocol)
    func configureFutureTeamInfoTableCell(indexPath: IndexPath, cell: FutureTeamInfoTableViewCellProtocol)
    func countLastFixtures() -> Int
    func countCollectionItems() -> Int
    func getFixtureIdIndex(indexPath: IndexPath)
    func getItemIndex(indexPath: IndexPath)
    var lastFixtures: MatchesByDate? {get}
}

class TeamInfoViewPresenter: TeamInfoViewPresenterProtocol {
    
    
    private(set) weak var view: TeamInfoViewProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var router: TeamInfoRouterProtocol?
    private(set) var lastFixtures: MatchesByDate?
    private(set) var teamId: Int
    var collectionCellItems: [CollectionModel] = [CollectionModel(name: "RESULTS"), CollectionModel(name: "CALENDAR"), CollectionModel(name: "TABLE"), CollectionModel(name: "PLAYERS")]
    
    
    required init(view: TeamInfoViewProtocol, apiProvider: RestAPIProviderProtocol, router: TeamInfoRouterProtocol, teamId: Int) {
        self.view = view
        self.apiProvider = apiProvider
        self.router = router
        self.teamId = teamId
        getTeamInfo(teamId: teamId)
    }
    
    func getTeamInfo(teamId: Int) {
        apiProvider.getLastMatchesTeamInfo(teamId: teamId, countLastMatches: 30) { [weak self] result in
            guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.lastFixtures = value
                        view.successGetInfo()
                    case .failure(let error):
                        view.failureGetInfo(error: error)
                    }
                }
        }
    }
        
    func configureTableCell(indexPath: IndexPath, cell: TeamInfoTableViewCellProtocol) {
        guard let matches = lastFixtures?.response[indexPath.row], let dateMatch = matches.fixture.date, let resultMatch = matches.teams.home.winner, let goalsHome = matches.goals.home, let goalsAway = matches.goals.away else {return}
        let logoFirstTeam = matches.teams.home.id
        let logoSecondTeam = matches.teams.away.id
        let nameFirstTeam = matches.teams.home.name
        let nameSecondTeam = matches.teams.away.name
        
        cell.configureCell(date: dateMatch, lofoFirstTeam: logoFirstTeam, logoSecondTeam: logoSecondTeam, nameFirstTeam: nameFirstTeam, nameSecondTeam: nameSecondTeam, goalsHome: goalsHome, goalsAway: goalsAway, win: resultMatch)
    }
    
    func configureFutureTeamInfoTableCell(indexPath: IndexPath, cell: FutureTeamInfoTableViewCellProtocol) {
        guard let matches = lastFixtures?.response[indexPath.row], let dateMatch = matches.fixture.date else {return}
        let logoFirstTeam = matches.teams.home.id
        let logoSecondTeam = matches.teams.away.id
        let nameFirstTeam = matches.teams.home.name
        let nameSecondTeam = matches.teams.away.name
        cell.configureCell(matchDate: dateMatch, firstTeamLogo: logoFirstTeam, secondTeamLogo: logoSecondTeam, firstTeamName: nameFirstTeam, secondTeamName: nameSecondTeam, matchStart: "")
    }
    
        
    func countLastFixtures() -> Int {
        lastFixtures?.response.count ?? 0
    }
    
    func getFixtureIdIndex(indexPath: IndexPath) {
        guard let matches = lastFixtures?.response[indexPath.row], let router = router else {return}
        let fixtureId = matches.fixture.id
        router.showMatchEvents(fixtureId: fixtureId)
    }
    
    func countCollectionItems() -> Int {
        collectionCellItems.count
    }
    
    func configureCollectionViewCell(indexPath: IndexPath, cell: TeamInfoCollectionViewCellProtocol) {
        let nameItem = collectionCellItems[indexPath.row].name
        cell.configureCell(item: nameItem)
    }
    
    func getItemIndex(indexPath: IndexPath) {
        if indexPath.row == 1 {
            apiProvider.getFutureMatchesTeamInfo(teamId: teamId, countFutureMatches: 30) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.lastFixtures = value
                        view.successGetInfo()
                    case .failure(let error):
                        view.failureGetInfo(error: error)
                    }
                }
            }
        } else if indexPath.row == 0 {
            apiProvider.getLastMatchesTeamInfo(teamId: teamId, countLastMatches: 30) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.lastFixtures = value
                        view.successGetInfo()
                    case .failure(let error):
                        view.failureGetInfo(error: error)
                    }
                }
            }
        }
    }
}
