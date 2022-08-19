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
    func scoreTableViewCellConfigure(cell: UITableViewCell, indexPath: IndexPath)
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
    
    func scoreTableViewCellConfigure(cell: UITableViewCell, indexPath: IndexPath) {
        guard let leagues = leaguesBySeason?.response else {return}
        let league = leagues[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = league.country.name
        content.secondaryText = league.league.name
        cell.contentConfiguration = content
    }
}
