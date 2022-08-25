//
//  TablesViewPresenter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 21.08.22.
//

import Foundation

protocol TablesViewPresenterProtocol: AnyObject {
    func getCountCountries() -> Int
    func getCountries()
    func configureTablesViewCell(indexPath: IndexPath, cell: TablesViewCellProtocol)
    func getCountryNameByTap(indexPath: IndexPath)
    var countries: DataCountries? {get}
}

class TablesViewPresenter: TablesViewPresenterProtocol {
   
    weak var view: TablesViewProtocol?
    var router: TablesRouterProtocol?
    var apiProvider: RestAPIProviderProtocol!
    private(set) var countries: DataCountries?
    
    required init(view: TablesViewProtocol, router: TablesRouterProtocol, apiProvider: RestAPIProviderProtocol) {
        self.view = view
        self.router = router
        self.apiProvider = apiProvider
        getCountries()
    }
    
    func getCountCountries() -> Int {
        guard let countries = countries?.response.count else {return 0}
        return countries
    }
        
    func getCountries() {
        apiProvider.getCountries { [weak self] result in
            guard let self = self, let view = self.view else {return}
            switch result {
            case .success(let value):
                self.countries = value
            case .failure(let error):
                view.failure(error: error)
            }
        }
    }
    
    func configureTablesViewCell(indexPath: IndexPath, cell: TablesViewCellProtocol) {
        guard let countries = countries?.response[indexPath.row], let countryLogo = countries.flag else {return}
        let countryName = countries.name
        cell.configureCell(nameCountry: countryName, logoCountry: countryLogo)
    }
    
    func getCountryNameByTap(indexPath: IndexPath) {
        guard let countryName = countries?.response[indexPath.row].name, let router = router else {return}
        router.showLeaguesByCountry(countryName: countryName)
    }
}
