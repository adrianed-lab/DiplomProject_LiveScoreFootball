//
//  MatchEventsViewPresenterProtocol.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import Foundation
import UIKit

protocol MatchEventsViewPresenterProtocol: AnyObject {
    func configureFirstTeamTableCell(indexPath: IndexPath, cell: EventsTableViewCellProtocol)
    func configureSecondTeamTableCell(indexPath: IndexPath, cell: SecondTeamEventsTableViewCellProtocol)
    func configureStatisticsTableCell(indexPath: IndexPath, cell: StatisticsTableViewCellProtocol)
    func configureCollectionCell(indexPath: IndexPath, cell: EventsCollectionViewCellProtocol)
    func configureMatchesH2HCell(indexPath: IndexPath, cell: LastFixturesByLeagueTableViewCell)
    func configureMatchLineupsCell(indexPath: IndexPath, cell: MatchLineupsTableViewCellProtocol)
    func configureStandingCell(indexPath: IndexPath, cell: StandingTableViewCellProtocol)
    func showHomeTeamInfo()
    func showAwayTeamInfo()
    func openStandingVC()
    func createButtonOpenStanding()
    func getFixtureId(indexPath: IndexPath)
    func createView()
    func countStadingsItems() ->Int
    func countH2HMatches() -> Int
    func countStatisticsItems() -> Int
    func countEventsFirstTeam() -> Int
    func countEventsSecondTeam() -> Int
    func countCollectionItem() -> Int
    func getFirstTeamName() -> String
    func getSecondTeamName() -> String
    func getMatchEventsForTeams()
    func getItemIndex(indexPath: IndexPath)
    var matchEventsFirstTeam: MatchEvents? {get}
    var matchStatistics: MatchStatistics? {get}
    var matchesH2H: MatchesByDate? {get}
    var standingByLeagueId: LeagueTable? {get}
    var fixture: DataMatchesByDate? {get}
}

class MatchEventsViewPresenter: MatchEventsViewPresenterProtocol {
    
    
    private(set) weak var view: MatchEventsViewProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var router: MatchEventsRouterProtocol?
    private(set) var matchEventsFirstTeam: MatchEvents?
    private(set) var matchEventsSecondTeam: MatchEvents?
    private(set) var matchStatistics: MatchStatistics?
    private(set) var matchLineups: MatchLineups?
    private(set) var matchesH2H: MatchesByDate?
    private(set) var standingByLeagueId: LeagueTable?
    private(set) var fixture: DataMatchesByDate?
    private(set) var codeCountry: String?
    private(set) var collectionItems: [CollectionModel] = [CollectionModel(name: "EVENTS"), CollectionModel(name: "STATISTICS"), CollectionModel(name: "LINE-UPS"), CollectionModel(name: "H2H"), CollectionModel(name: "TABLE")]
    
    required init(view: MatchEventsViewProtocol, apiProvider: RestAPIProviderProtocol, router: MatchEventsRouterProtocol, fixture: DataMatchesByDate, codeCountry: String) {
        self.view = view
        self.apiProvider = apiProvider
        self.router = router
        self.fixture = fixture
        self.codeCountry = codeCountry
        getMatchEventsForTeams()
    }
    
    func getMatchEventsForTeams() {
        guard let fixture = fixture else {
            return
        }
        let fixtureId = fixture.fixture.id
        let teamIdFirstTeam = fixture.teams.home.id
        let teamIdSecondTeam = fixture.teams.away.id
        apiProvider.getMatchEvents(fixture: fixtureId, teamId: teamIdFirstTeam) { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    if value.response.isEmpty {
                        view.openWarningMessage()
                    }
                    self.matchEventsFirstTeam = value
                    view.successGetEvents()
                case .failure(let error):
                    view.failureGetEvents(error: error)
                }
            }
        }
        apiProvider.getMatchEvents(fixture: fixtureId, teamId: teamIdSecondTeam) { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    if value.response.isEmpty {
                        view.openWarningMessage()
                    }
                    self.matchEventsSecondTeam = value
                    view.successGetEvents()
                case .failure(let error):
                    view.failureGetEvents(error: error)
                }
            }
        }
    }
    
    func countStadingsItems() ->Int {
        standingByLeagueId?.response.first?.league.standings.first?.count ?? 0
    }
    
    func countH2HMatches() -> Int {
        matchesH2H?.response.count ?? 0
    }
    
    func countEventsFirstTeam() -> Int {
        matchEventsFirstTeam?.response.count ?? 0
    }
    
    func countEventsSecondTeam() -> Int {
        matchEventsSecondTeam?.response.count ?? 0
    }
    
    func countStatisticsItems() -> Int {
        matchStatistics?.response.first?.statistics.count ?? 0
    }
    
    func getFirstTeamName() -> String {
        matchEventsFirstTeam?.response.first?.team.name ?? ""
    }
    
    func getSecondTeamName() -> String {
        matchEventsSecondTeam?.response.first?.team.name ?? ""
    }
    
    func countCollectionItem() -> Int {
        collectionItems.count
    }
    
    func getItemIndex(indexPath: IndexPath) {
        guard let fixture = fixture else {return}
        let fixtureId = fixture.fixture.id
        let teamIdFirstTeam = fixture.teams.home.id
        let teamIdSecondTeam = fixture.teams.away.id
        let leagueId = fixture.league.id
        if indexPath.row == 0 {
        apiProvider.getMatchEvents(fixture: fixtureId, teamId: teamIdFirstTeam) { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    if value.response.isEmpty {
                        view.openWarningMessage()
                    }
                    self.matchEventsFirstTeam = value
                    view.successGetEvents()
                case .failure(let error):
                    view.failureGetEvents(error: error)
                }
            }
        }
        apiProvider.getMatchEvents(fixture: fixtureId, teamId: teamIdSecondTeam) { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    if value.response.isEmpty {
                        view.openWarningMessage()
                    }
                    self.matchEventsSecondTeam = value
                    view.successGetEvents()
                case .failure(let error):
                    view.failureGetEvents(error: error)
                }
            }
        }
        } else if indexPath.row == 1 {
            apiProvider.getMatchStatistics(fixture: fixtureId) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let value):
                            if value.response.isEmpty {
                                view.openWarningMessage()
                            }
                            self.matchStatistics = value
                            view.successGetEvents()
                        case .failure(let error):
                            view.failureGetEvents(error: error)
                        }
                    }
                }
        } else if indexPath.row == 2 {
            apiProvider.getMatchLineups(fixture: fixtureId) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let value):
                            if value.response.isEmpty {
                                view.openWarningMessage()
                            }
                            self.matchLineups = value
                            view.successGetEvents()
                        case .failure(let error):
                            view.failureGetEvents(error: error)
                        }
                    }
                }
        } else if indexPath.row == 3 {
            apiProvider.getMatchH2H(h2h: "\(teamIdFirstTeam)-\(teamIdSecondTeam)", last: 10) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let value):
                            if value.response.isEmpty {
                                view.openWarningMessage()
                            }
                            self.matchesH2H = value
                            view.successGetEvents()
                        case .failure(let error):
                            view.failureGetEvents(error: error)
                        }
                    }
                }
        }
        else if indexPath.row == 4 {
            apiProvider.getLeagueTable(seasonYear: 2022, leagueId: leagueId) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let value):
                            if value.response.isEmpty {
                                view.openWarningMessage()
                            }
                            self.standingByLeagueId = value
                            view.successGetEvents()
                        case .failure(let error):
                            view.failureGetEvents(error: error)
                        }
                    }
            }
        }
    }
    func getFixtureId(indexPath: IndexPath) {
        guard let router = router, let fixtures = matchesH2H?.response[indexPath.row], let flag = fixtures.league.flag else {return}
        router.showMatchEvent(fixture: fixtures, codeCountry: flag)
    }
    func openStandingVC() {
        guard let router = router, let fixture = fixture, let countryCode = codeCountry else {return}
        let leagueId = fixture.league.id
        router.showStanding(leagueId: leagueId, countryCode: countryCode)
    }
    
    func showHomeTeamInfo() {
        guard let routing = router, let fixture = fixture, let flag = fixture.league.flag else {return}
        let teamId = fixture.teams.home.id
        let teamName = fixture.teams.home.name
        let countryName = fixture.league.country
        let leagueId = fixture.league.id
        routing.showTeamInfo(teamId: teamId, countryCode: flag, teamName: teamName, countryName: countryName, leagueId: leagueId)
    }
    
    func showAwayTeamInfo() {
        guard let routing = router, let fixture = fixture, let flag = fixture.league.flag else {return}
        let teamId = fixture.teams.away.id
        let teamName = fixture.teams.away.name
        let countryName = fixture.league.country
        let leagueId = fixture.league.id
        routing.showTeamInfo(teamId: teamId, countryCode: flag, teamName: teamName, countryName: countryName, leagueId: leagueId)
    }


    
    func configureStandingCell(indexPath: IndexPath, cell: StandingTableViewCellProtocol) {
        guard let standings = standingByLeagueId?.response.first?.league.standings.first?[indexPath.row], let playedGames = standings.all.played, let goalsFor = standings.all.goals.goalsFor, let goalsAgainst = standings.all.goals.against else {return}
        let teamRank = standings.rank
        let teamLogo = standings.team.id ?? 1
        let teamName = standings.team.name
        let points = standings.points
        cell.configureCell(rank: teamRank, teamLogo: teamLogo, teamName: teamName, games: playedGames, goalsFor: goalsFor, goalsAgainst: goalsAgainst, points: points)
    }
    
    func configureMatchLineupsCell(indexPath: IndexPath, cell: MatchLineupsTableViewCellProtocol) {
        switch indexPath.section {
        case 0:
            let coachSecondTeam = matchLineups?.response.last?.coach.name ?? "No name couch"
            let coachFirstTeam = matchLineups?.response.first?.coach.name ?? "No name couch"
            return cell.configureCell(teamFirst: coachFirstTeam, teamSecond: coachSecondTeam)
        case 1:
            let matchFormationFirstTeam = matchLineups?.response.first?.formation ?? "4-4-2"
            let matchFormationSecondTeam = matchLineups?.response.last?.formation ?? "4-4-2"
            return cell.configureCell(teamFirst: matchFormationFirstTeam, teamSecond: matchFormationSecondTeam)
        case 2:
            guard let startXIFirstTeam = matchLineups?.response.first?.startXI[indexPath.row] else {return}
            guard let startXISecondTeam = matchLineups?.response.last?.startXI[indexPath.row] else {return}
            let nameFirstTeam = startXIFirstTeam.player.name
            let nameSecondTeam = startXISecondTeam.player.name
            let positionFirstTeam = startXIFirstTeam.player.pos ?? ""
            let positionSecondTeam = startXISecondTeam.player.pos ?? ""
            let numberFirstTeam = startXIFirstTeam.player.number ?? 1
            let numberSecondTeam = startXISecondTeam.player.number ?? 1
            return cell.configureCellSecond(playerNameFirstTeam: nameFirstTeam, playerNameSecondTeam: nameSecondTeam, positionsFirstTeam: positionFirstTeam, positionsSecondTeam: positionSecondTeam, numberFirstTeam: numberFirstTeam, numberSecondTeam: numberSecondTeam)
        case 3:
            guard let substitutesFirstTeam = matchLineups?.response.first?.substitutes[indexPath.row] else {return}
            guard let substitutesSecondTeam = matchLineups?.response.last?.substitutes[indexPath.row]  else {return}
            let nameFirstTeamSub = substitutesFirstTeam.player.name
            let nameSecondTeamSub = substitutesSecondTeam.player.name
            let positionFirstTeamSub = substitutesFirstTeam.player.pos ?? ""
            let positionSecondTeamSub = substitutesSecondTeam.player.pos ?? ""
            let numberFirstTeamSub = substitutesFirstTeam.player.number ?? 1
            let numberSecondTeamSub = substitutesSecondTeam.player.number ?? 1
            return cell.configureCellSecond(playerNameFirstTeam: nameFirstTeamSub, playerNameSecondTeam: nameSecondTeamSub, positionsFirstTeam: positionFirstTeamSub, positionsSecondTeam: positionSecondTeamSub, numberFirstTeam: numberFirstTeamSub, numberSecondTeam: numberSecondTeamSub)
        default:
            break
        }
    }
    func configureMatchesH2HCell(indexPath: IndexPath, cell: LastFixturesByLeagueTableViewCell) {
        guard let matches = matchesH2H?.response[indexPath.row], let dateMatch = matches.fixture.date else {return}
        let goalsHome = matches.goals.home ?? 0
        let goalsAway = matches.goals.away ?? 0
        let logoFirstTeam = matches.teams.home.id
        let logoSecondTeam = matches.teams.away.id
        let nameFirstTeam = matches.teams.home.name
        let nameSecondTeam = matches.teams.away.name
        
        cell.configureCell(date: dateMatch.getDate(.shortDate), lofoFirstTeam: logoFirstTeam, logoSecondTeam: logoSecondTeam, nameFirstTeam: nameFirstTeam, nameSecondTeam: nameSecondTeam, goalsHome: goalsHome, goalsAway: goalsAway)
    }
    
    func configureStatisticsTableCell(indexPath: IndexPath, cell: StatisticsTableViewCellProtocol) {
        guard let matchStatisticsFirst = matchStatistics?.response.first?.statistics[indexPath.row] , let matchStatisticsSecond = matchStatistics?.response.last?.statistics[indexPath.row] else {return}
        let valueFirstTeam = matchStatisticsFirst.value
        let valueSecondTeam = matchStatisticsSecond.value
        let type = matchStatisticsFirst.type
        cell.configureCell(type: type, valueFirstTeam: valueFirstTeam, valueSecondTeam: valueSecondTeam)
    }
    
    func configureFirstTeamTableCell(indexPath: IndexPath, cell: EventsTableViewCellProtocol) {
        
        guard let matchEventsTeamFirst = matchEventsFirstTeam?.response[indexPath.row]  else {return}
        let assistPlayerNameFirst = matchEventsTeamFirst.assist.name ?? ""
        let playerNameFirst = matchEventsTeamFirst.player.name ?? ""
        let typeEventFirst = matchEventsTeamFirst.type 
        let detailTypeFirst = matchEventsTeamFirst.detail
        let timeEventFirst = matchEventsTeamFirst.time.elapsed
        cell.configureCell(playerNameFirstTeam: playerNameFirst, assistentPlayerNameFirstTeam: assistPlayerNameFirst, typeEventFirstTeam: typeEventFirst, detailTypeEventFirstTeam: detailTypeFirst, timeEventFirstTeam: timeEventFirst)
    }
    
    func configureSecondTeamTableCell(indexPath: IndexPath, cell: SecondTeamEventsTableViewCellProtocol) {
        guard let matchEventsTeamSecond = matchEventsSecondTeam?.response[indexPath.row] else {return}
        let assistPlayerName = matchEventsTeamSecond.assist.name ?? ""
        let playerName = matchEventsTeamSecond.player.name ?? ""
        let typeEvent = matchEventsTeamSecond.type
        let detailType = matchEventsTeamSecond.detail
        let timeEvent = matchEventsTeamSecond.time.elapsed
        cell.configureCell(playerName: playerName, assistentPlayerName: assistPlayerName, typeEvent: typeEvent, detailTypeEvent: detailType, timeEvent: timeEvent)
    }
    
    func configureCollectionCell(indexPath: IndexPath, cell: EventsCollectionViewCellProtocol) {
        let collectionItemName = collectionItems[indexPath.row].name
        cell.configureCell(collectionItem: collectionItemName)
    }
    
    func createView() {
        guard let fixture = fixture, let view = view else {return}
        let idFirstTeam = fixture.teams.home.id
        let idSecondTeam = fixture.teams.away.id
        let nameFirstTeam = fixture.teams.home.name
        let nameSecondTeam = fixture.teams.away.name
        let goalsFirstTeam = fixture.goals.home ?? 0
        let goalsSecondTeam = fixture.goals.away ?? 0
        let matchStart = fixture.fixture.date ?? ""
        view.configureMatchEventView(logoFirstTeam: idFirstTeam, logoSecondTeam: idSecondTeam, nameFirstTeam: nameFirstTeam, nameSecondTeam: nameSecondTeam, goalsFirstTeam: goalsFirstTeam, goalsSecondTeam: goalsSecondTeam, dateMatch: matchStart.getDate(.fullDate))
    }
    
    func createButtonOpenStanding() {
        guard let view = view, let code = codeCountry, let fixtures = fixture else {return}
        let nameCountry = fixtures.league.country
        let nameLeague = fixtures.league.name
        view.configureButton(flag: code, nameCountry: nameCountry, nameLeague: nameLeague)
    }
}

