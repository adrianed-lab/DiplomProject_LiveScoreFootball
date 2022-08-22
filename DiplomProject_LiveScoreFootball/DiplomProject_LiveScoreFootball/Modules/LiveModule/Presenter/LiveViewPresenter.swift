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
    
    
    weak var view: LiveViewProtocol?
    var router: ViewsRouterProtocol?
    var apiProvider: RestAPIProviderProtocol!
    var liveMatches: LiveMatches?
    
    required init(view: LiveViewProtocol, router: ViewsRouterProtocol, apiProvider: RestAPIProviderProtocol) {
        self.view = view
        self.router = router
        self.apiProvider = apiProvider
        getLiveMatches(live: "all")
    }
    
   func getLiveMatches(live: String) {
       apiProvider.getLiveMatches(live: live) { [weak self] result in
           guard let self = self, let view = self.view else {return}
           DispatchQueue.main.async {
               switch result {
               case .success(let value):
                   self.liveMatches = value
                   view.successGetLiveMatches()
               case .failure(let error):
                   view.failure(error: error)
               }
           }
       }
    }
        
   func getLeaguesCount() -> Int {
       guard let liveMatches = liveMatches else {return 0}
       return liveMatches.response.count
    }
    func configureLiveTableViewCell(indexPath: IndexPath, cell: LiveTableViewCellProtocol) {
        guard let liveMatches = liveMatches else {return}
        let live = liveMatches.response[indexPath.row]
        let logoFirstTeam = String(live.teams.home.id)
        let logoSecondTeam = String(live.teams.away.id)
        let nameFirstTeam = live.teams.home.name
        let nameSecondTeam = live.teams.away.name
        guard let goalsFirstTeam = live.goals.home, let goalsSecondTeam = live.goals.away, let currentTime = live.fixture.status.elapsed else {return}
        cell.configureCell(firstTeamLogo: logoFirstTeam, secondTeamLogo: logoSecondTeam, firstTeamName: nameFirstTeam, secondTeamName: nameSecondTeam, currentTimeInfo: currentTime, homeGoalsTeam: goalsFirstTeam, awayGoalsTeam: goalsSecondTeam)
    }
}
