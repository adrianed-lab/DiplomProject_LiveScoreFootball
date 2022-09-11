//
//  TeamInfoViewPresenterProtocol.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 30.08.22.
//

import Foundation

protocol TeamInfoViewPresenterProtocol: AnyObject {
    func getTeamInfo(teamId: Int)
    func configureStandingCell(indexPath: IndexPath, cell: StandingTableViewCellProtocol)
    func configureTableCell(indexPath: IndexPath, cell: LastFixturesByLeagueTableViewCell)
    func configureCollectionViewCell(indexPath: IndexPath, cell: TeamInfoCollectionViewCellProtocol)
    func configureFutureTeamInfoTableCell(indexPath: IndexPath, cell: FutureTeamInfoTableViewCellProtocol)
    func configurePlayersCell(indexPath: IndexPath, cell: PlayersByTeamIdTableViewCellProtocol)
    func configureView()
    func countPlayers() -> Int
    func countStandingItems() -> Int
    func countFutureFixtures() -> Int
    func countLastFixtures() -> Int
    func countCollectionItems() -> Int
    func getFixtureIdIndex(indexPath: IndexPath)
    func getItemIndex(indexPath: IndexPath)
    var standingsByLeagueID: LeagueTable? {get}
    var lastFixtures: MatchesByDate? {get}
    var futureFixtures: MatchesByDate? {get}
    var playersByTeamId: PlayersByTeamId? {get}
}

class TeamInfoViewPresenter: TeamInfoViewPresenterProtocol {
    
    
    private(set) weak var view: TeamInfoViewProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var router: TeamInfoRouterProtocol?
    private(set) var lastFixtures: MatchesByDate?
    private(set) var futureFixtures: MatchesByDate?
    private(set) var standingsByLeagueID: LeagueTable?
    private(set) var playersByTeamId: PlayersByTeamId?
    private(set) var teamId: Int
    private(set) var countryCode: String?
    private(set) var teamName: String
    private(set) var countryName: String
    private(set) var leagueId: Int
    var collectionCellItems: [CollectionModel] = [CollectionModel(name: "RESULTS"), CollectionModel(name: "CALENDAR"), CollectionModel(name: "TABLE"), CollectionModel(name: "PLAYERS")]
    
    
    required init(view: TeamInfoViewProtocol, apiProvider: RestAPIProviderProtocol, router: TeamInfoRouterProtocol, teamId: Int, countryCode: String, teamName: String, countryName: String, leagueId: Int) {
        self.view = view
        self.apiProvider = apiProvider
        self.router = router
        self.teamId = teamId
        self.countryCode = countryCode
        self.teamName = teamName
        self.countryName = countryName
        self.leagueId = leagueId
        getTeamInfo(teamId: teamId)
    }
    
    func getTeamInfo(teamId: Int) {
        apiProvider.getLastMatchesTeamInfo(teamId: teamId, countLastMatches: 30, timeZone: "Europe/Minsk") { [weak self] result in
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
        
    func configureTableCell(indexPath: IndexPath, cell: LastFixturesByLeagueTableViewCell) {
        guard let matches = lastFixtures?.response[indexPath.row] else {return}
        let dateMatch = matches.fixture.date ?? ""
        let goalsHome = matches.goals.home ?? 0
        let goalsAway = matches.goals.away ?? 0
        let logoFirstTeam = matches.teams.home.id
        let logoSecondTeam = matches.teams.away.id
        let nameFirstTeam = matches.teams.home.name
        let nameSecondTeam = matches.teams.away.name
        cell.configureCell(date: dateMatch.getDate(.shortDate), lofoFirstTeam: logoFirstTeam, logoSecondTeam: logoSecondTeam, nameFirstTeam: nameFirstTeam, nameSecondTeam: nameSecondTeam, goalsHome: goalsHome, goalsAway: goalsAway)
    }
    
    func configureFutureTeamInfoTableCell(indexPath: IndexPath, cell: FutureTeamInfoTableViewCellProtocol) {
        guard let matches = futureFixtures?.response[indexPath.row] else {return}
        let dateMatch = matches.fixture.date ?? ""
        let logoFirstTeam = matches.teams.home.id
        let logoSecondTeam = matches.teams.away.id
        let nameFirstTeam = matches.teams.home.name
        let nameSecondTeam = matches.teams.away.name
        cell.configureCell(matchDate: dateMatch.getDate(.shortDate), firstTeamLogo: logoFirstTeam, secondTeamLogo: logoSecondTeam, firstTeamName: nameFirstTeam, secondTeamName: nameSecondTeam, matchStart: dateMatch.getDate(.startTime))
    }
    
    func configureStandingCell(indexPath: IndexPath, cell: StandingTableViewCellProtocol) {
        guard let standings = standingsByLeagueID?.response.first?.league.standings.first?[indexPath.row], let playedGames = standings.all.played, let goalsFor = standings.all.goals.goalsFor, let goalsAgainst = standings.all.goals.against else {return}
        let teamRank = standings.rank
        let teamLogo = standings.team.id
        let teamName = standings.team.name
        let points = standings.points
        cell.configureCell(rank: teamRank, teamLogo: teamLogo, teamName: teamName, games: playedGames, goalsFor: goalsFor, goalsAgainst: goalsAgainst, points: points)
    }
    
    func configurePlayersCell(indexPath: IndexPath, cell: PlayersByTeamIdTableViewCellProtocol) {
        guard let players = playersByTeamId?.response.first?.players[indexPath.row] else {return}
        let playerId = players.id
        let playerName = players.name
        let playerNumber = players.number ?? 0
        cell.configureCell(photoPlayerId: playerId, playerName: playerName, number: playerNumber)
    }
    
    
    func countStandingItems() -> Int {
        standingsByLeagueID?.response.first?.league.standings.first?.count ?? 0
    }
    
    func countLastFixtures() -> Int {
        lastFixtures?.response.count ?? 0
    }
    
    func countFutureFixtures() -> Int {
        futureFixtures?.response.count ?? 0
    }
    
    func countPlayers() -> Int {
        playersByTeamId?.response.first?.players.count ?? 0
    }
    
    func getFixtureIdIndex(indexPath: IndexPath) {
        guard let matches = lastFixtures?.response[indexPath.row], let router = router else {return}
        router.showMatchEvents(fixture: matches)
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
            apiProvider.getFutureMatchesTeamInfo(teamId: teamId, countFutureMatches: 30, timeZone: "Europe/Minsk") { [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.futureFixtures = value
                        view.successGetInfo()
                    case .failure(let error):
                        view.failureGetInfo(error: error)
                    }
                }
            }
        } else if indexPath.row == 0 {
            apiProvider.getLastMatchesTeamInfo(teamId: teamId, countLastMatches: 30, timeZone: "Europe/Minsk") { [weak self] result in
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
        } else if indexPath.row == 2 {
            apiProvider.getLeagueTable(seasonYear: 2022, leagueId: leagueId) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.standingsByLeagueID = value
                        view.successGetInfo()
                    case .failure(let error):
                        view.failureGetInfo(error: error)
                    }
                }
            }
        } else if indexPath.row == 3 {
            apiProvider.getPlayersByTeamId(teamId: teamId) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.playersByTeamId = value
                        view.successGetInfo()
                    case .failure(let error):
                        view.failureGetInfo(error: error)
                    }
                }
            }
        }
    }
    
    func configureView() {
        guard let countryCode = countryCode, let view = view else {return}
        view.configureView(countryCode: countryCode, nameCountry: countryName, teamId: teamId, nameTeam: teamName )
    }
}
