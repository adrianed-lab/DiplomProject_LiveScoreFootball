//
//  LeaguesByCountryViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 24.08.22.
//

import Foundation
import UIKit

protocol LeaguesByCountryViewPresenterProtocol: AnyObject {
    func getLeaguesByCountry(nameCountry: String)
    func countLeagues() -> Int
    func configureCell(indexPath: IndexPath, cell: LeaguesByCountryTableViewCell)
    func getLeagueId(indexPath: IndexPath)
    var leaguesByCountry: LeaguesByCountryNameOrSeason? {get}
}

class LeaguesByCountryViewPresenter: LeaguesByCountryViewPresenterProtocol {
    
    weak var view: LeaguesByCountryViewProtocol?
    var router: LeaguesByCountryRouterProtocol?
    var apiProvider: RestAPIProviderProtocol!
    private(set) var leaguesByCountry: LeaguesByCountryNameOrSeason?
    var nameCountry: String
    
    required init(view: LeaguesByCountryViewProtocol, router: LeaguesByCountryRouterProtocol, apiProvider: RestAPIProviderProtocol, nameCountry: String) {
        self.view = view
        self.router = router
        self.apiProvider = apiProvider
        self.nameCountry = nameCountry
        getLeaguesByCountry(nameCountry: nameCountry)
    }
    
    func getLeaguesByCountry(nameCountry: String) {
        apiProvider.getLeaguesByCountry(countryName: nameCountry) { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.leaguesByCountry = value
                    view.successGetLeagues()
                case .failure(let error):
                    view.failure(error: error)
                }
            }
            
        }
    }
    
    func countLeagues() -> Int {
        guard let leaguesByCountry = leaguesByCountry?.response.count else {return 0}
        return leaguesByCountry

    }
    
    func configureCell(indexPath: IndexPath, cell: LeaguesByCountryTableViewCell) {
        guard let leagueName = leaguesByCountry?.response[indexPath.row].league.name else{return}
        cell.configureTableViewCell(leagueName: leagueName)
    }
    
    func getLeagueId(indexPath: IndexPath) {
        guard let leagueId = leaguesByCountry?.response[indexPath.row].league.id, let router = router else{return}
        router.showStandings(leagueId: leagueId)
    }
}
