//
//  PresenterMainVC.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 12.08.22.
//

import Foundation
import UIKit

protocol PresenterScoreViewProtocol: AnyObject {
    init(view: ScoreViewProtocol, apiProvider: RestAPIProviderProtocol, router: RouterProtocol)
    func getMatchesByDate(date: String)
    var matchesBydate: MatchesByDate? {get set}
}

class PresenterScoreView: PresenterScoreViewProtocol {
    weak var view: ScoreViewProtocol!
    var apiProvider: RestAPIProviderProtocol!
    var matchesBydate: MatchesByDate?
    var router: RouterProtocol?
    
    required init(view: ScoreViewProtocol, apiProvider: RestAPIProviderProtocol, router: RouterProtocol) {
        self.view = view
        self.apiProvider = apiProvider
        self.router = router
        getMatchesByDate(date: Constants.currentDate)
    }

    func getMatchesByDate(date: String) {
        apiProvider.getMatchesByDate(date: date) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let value):
                self.matchesBydate = value
                self.view.successGetMatchesByDate()
            case .failure(let error):
                self.view.failure(error: error)
            }
        }
    
    
    
    
}

}
