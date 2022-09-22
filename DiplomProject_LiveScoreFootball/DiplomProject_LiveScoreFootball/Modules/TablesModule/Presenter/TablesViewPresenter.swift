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
    func getAuthorizationVC()
    func configureTablesViewCell(indexPath: IndexPath, cell: TablesViewCellProtocol)
    func getCountryNameByTap(indexPath: IndexPath)
    var countries: DataCountries? {get}
}

class TablesViewPresenter: TablesViewPresenterProtocol {
   
    private(set) weak var view: TablesViewProtocol?
    private(set) var router: TablesRouterProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var countries: DataCountries?
    
    required init(view: TablesViewProtocol, router: TablesRouterProtocol, apiProvider: RestAPIProviderProtocol) {
        self.view = view
        self.router = router
        self.apiProvider = apiProvider
        getCountries()
    }
    
    func getCountCountries() -> Int {
        countries?.response.count ?? 0
    }
    
    // Получение стран
    func getCountries() {
        apiProvider.getCountries { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.countries = value
                case .failure(let error):
                    view.failure(error: error)
                }
            }
        }
    }
    
    // Получени данных для сборки ячейки
    func configureTablesViewCell(indexPath: IndexPath, cell: TablesViewCellProtocol) {
        guard let countries = countries?.response[indexPath.row], let countryLogo = countries.flag else {return}
        let countryName = countries.name
        cell.configureCell(nameCountry: countryName, logoCountry: countryLogo)
    }
    
    // Получение название страны по нажатию на ячейку и передачи странны и ее кода на роутер
    func getCountryNameByTap(indexPath: IndexPath) {
        guard let countries = countries?.response[indexPath.row], let countryCode = countries.flag, let router = router else {return}
        let countryName = countries.name
        router.showLeaguesByCountry(countryName: countryName, codeCountry: countryCode)
    }
    
    func getAuthorizationVC() {
        guard let router = router else {return}
        router.showAuthorizationVC()
    }
}
