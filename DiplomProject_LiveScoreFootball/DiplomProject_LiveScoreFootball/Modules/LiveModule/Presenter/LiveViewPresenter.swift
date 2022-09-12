//
//  LiveViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import Foundation

protocol LiveViewPresenterProtocol: AnyObject {
    func getLiveMatches(live: String)
    func getLeaguesCount() -> Int
    func configureLiveTableViewCell(indexPath: IndexPath, cell: LiveTableViewCellProtocol)
    var liveMatches: LiveMatches? {get}
}

class LiveViewPresenter: LiveViewPresenterProtocol {
    
    private(set) weak var view: LiveViewProtocol?
    private(set) var router: LiveRouterProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var liveMatches: LiveMatches?
    
    required init(view: LiveViewProtocol, router: LiveRouterProtocol, apiProvider: RestAPIProviderProtocol) {
        self.view = view
        self.router = router
        self.apiProvider = apiProvider
        getLiveMatches(live: "all")
    }
    
   func getLiveMatches(live: String) {
       apiProvider.getLiveMatches(live: live, timeZone: "Europe/Minsk") { [weak self] result in
           guard let self = self, let view = self.view else {return}
           DispatchQueue.main.async {
               switch result {
               case .success(let value):
                   self.liveMatches = value
               case .failure(let error):
                   view.failure(error: error)
               }
           }
       }
    }
        
   func getLeaguesCount() -> Int {
       liveMatches?.response.count ?? 0
    }
    
    func configureLiveTableViewCell(indexPath: IndexPath, cell: LiveTableViewCellProtocol) {
        guard let liveMatches = liveMatches?.response[indexPath.row], let goalsFirstTeam = liveMatches.goals.home, let goalsSecondTeam = liveMatches.goals.away, let currentTime = liveMatches.fixture.status.elapsed else {return}
        let logoFirstTeam = liveMatches.teams.home.id
        let logoSecondTeam = liveMatches.teams.away.id
        let nameFirstTeam = liveMatches.teams.home.name
        let nameSecondTeam = liveMatches.teams.away.name
        cell.configureCell(firstTeamLogo: logoFirstTeam, secondTeamLogo: logoSecondTeam, firstTeamName: nameFirstTeam, secondTeamName: nameSecondTeam, currentTimeInfo: currentTime, homeGoalsTeam: goalsFirstTeam, awayGoalsTeam: goalsSecondTeam)
    }
    
    
}
