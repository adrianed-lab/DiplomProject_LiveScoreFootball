//
//  LeaguesByCountryViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 24.08.22.
//

import Foundation
import UIKit
import SnapKit

protocol LeaguesByCountryViewPresenterProtocol: AnyObject {
    func getLeaguesByCountry(nameCountry: String)
    func countLeagues() -> Int
    func configureCell(indexPath: IndexPath, cell: LeaguesByCountryTableViewCell)
    func getLeagueId(indexPath: IndexPath)
    func getViewForHeaderInSection(view: UIView) -> UIView
    var leaguesByCountry: LeaguesByCountryNameOrSeason? {get}
}

class LeaguesByCountryViewPresenter: LeaguesByCountryViewPresenterProtocol {
    
    private(set) weak var view: LeaguesByCountryViewProtocol?
    private(set) var router: LeaguesByCountryRouterProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var leaguesByCountry: LeaguesByCountryNameOrSeason?
    private(set) var nameCountry: String
    private(set) var codeCountry: String
    
    required init(view: LeaguesByCountryViewProtocol, router: LeaguesByCountryRouterProtocol, apiProvider: RestAPIProviderProtocol, nameCountry: String, codeCountry: String) {
        self.view = view
        self.router = router
        self.apiProvider = apiProvider
        self.nameCountry = nameCountry
        self.codeCountry = codeCountry
        getLeaguesByCountry(nameCountry: nameCountry)
    }
    
    func getLeaguesByCountry(nameCountry: String) {
        apiProvider.getLeaguesByCountry(countryName: nameCountry, type: "league") { [weak self] result in
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
        leaguesByCountry?.response.count ?? 0
    }
    
    func configureCell(indexPath: IndexPath, cell: LeaguesByCountryTableViewCell) {
        guard let leagueName = leaguesByCountry?.response[indexPath.row].league.name else {return}
        cell.configureTableViewCell(leagueName: leagueName)
    }
    
    func getViewForHeaderInSection(view: UIView) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        headerView.backgroundColor = .systemBlue
        let imageView = UIImageView()
        let countryLabel = UILabel()
        DispatchQueue.main.async {
            imageView.snp.makeConstraints { make in
                make.leading.equalTo(headerView).inset(16)
                make.width.equalTo(25)
                make.height.equalTo(20)
                make.centerY.equalTo(headerView)
            }
            countryLabel.snp.makeConstraints { make in
                make.leading.equalTo(imageView.snp.trailing).offset(10)
                make.height.equalTo(20)
                make.centerY.equalTo(headerView)
            }
            imageView.getCountryFlag(codeCountry: self.codeCountry)
            countryLabel.text = self.nameCountry
            countryLabel.font = UIFont(name: "System", size: 13)
            countryLabel.textColor = .white
        }
        headerView.addSubview(imageView)
        headerView.addSubview(countryLabel)
        DispatchQueue.main.async {
            let blur = UIBlurEffect(style: .systemUltraThinMaterialDark)
            let blurView = UIVisualEffectView(effect: blur)
            blurView.alpha = 0.8
            blurView.frame = CGRect(x: 0, y: 0, width: headerView.frame.size.width, height: headerView.frame.size.height)
            blurView.layer.masksToBounds = true
            headerView.addSubview(blurView)
            headerView.sendSubviewToBack(blurView)
        }
        return headerView
    }
    
    func getLeagueId(indexPath: IndexPath) {
        guard let leagues = leaguesByCountry?.response[indexPath.row], let codeCountry = leagues.country.flag, let router = router else {return}
        let leagueId = leagues.league.id
        let nameCountry = leagues.country.name
        router.showStandings(leagueId: leagueId, countryCode: codeCountry, countryName: nameCountry)
    }
}
