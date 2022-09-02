//
//  MatchEventsViewPresenterProtocol.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 2.09.22.
//

import Foundation

protocol MatchEventsViewPresenterProtocol: AnyObject {
    func configureTableCell(indexPath: IndexPath, cell: EventsTableViewCellProtocol)
    func configureCollectionCell(indexPath: IndexPath, cell: EventsCollectionViewCellProtocol)
    func countEvents() -> Int
    func countCollectionItem() -> Int
    func getMatchEvents(fixtureId: Int)
    func getItemIndex(indexPath: IndexPath)
    var matchEvents: MatchEvents? {get}
}

class MatchEventsViewPresenter: MatchEventsViewPresenterProtocol {
    

    weak var view: MatchEventsViewProtocol?
    private(set) var apiProvider: RestAPIProviderProtocol!
    private(set) var router: MatchEventsRouterProtocol?
    private(set) var fixtureId: Int
    private(set) var matchEvents: MatchEvents?
    private(set) var collectionItems: [CollectionModel] = [CollectionModel(name: "EVENTS"), CollectionModel(name: "STATISTICS"), CollectionModel(name: "LINE-UPS"), CollectionModel(name: "H2H"), CollectionModel(name: "TABLE")]
    
    required init(view: MatchEventsViewProtocol, apiProvider: RestAPIProviderProtocol, router: MatchEventsRouterProtocol, fixtureId: Int) {
        self.view = view
        self.apiProvider = apiProvider
        self.router = router
        self.fixtureId = fixtureId
        getMatchEvents(fixtureId: fixtureId)
    }
    
    func getMatchEvents(fixtureId: Int) {
        apiProvider.getMatchEvents(fixture: fixtureId) { [weak self] result in
            guard let self = self, let view = self.view else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    self.matchEvents = value
                    view.successGetEvents()
                case .failure(let error):
                    view.failureGetEvents(error: error)
                }
            }
        }
    }
    
    func countEvents() -> Int {
        let matchEvents = matchEvents?.response.count ?? 0
        return matchEvents
    }
    
    func countCollectionItem() -> Int {
        collectionItems.count
    }
    
    func getItemIndex(indexPath: IndexPath) {
        if indexPath.row == 0 {
            apiProvider.getMatchEvents(fixture: fixtureId) { [weak self] result in
                guard let self = self, let view = self.view else {return}
                DispatchQueue.main.async {
                    switch result {
                    case .success(let value):
                        self.matchEvents = value
                        view.successGetEvents()
                    case .failure(let error):
                        view.failureGetEvents(error: error)
                    }
                }
            }
        }
    }
    
    func configureTableCell(indexPath: IndexPath, cell: EventsTableViewCellProtocol) {
        guard let matchEvents = matchEvents?.response[indexPath.row], let assistPlayerName = matchEvents.assist.name, let playerName = matchEvents.player.name else {return}
        let typeEvent = matchEvents.type
        let detailType = matchEvents.detail
        let timeEvent = matchEvents.time.elapsed
        cell.configureCell(playerName: playerName, assistentPlayerName: assistPlayerName, typeEvent: typeEvent, detailTypeEvent: detailType, timeEvent: timeEvent)
        
    }
    
    func configureCollectionCell(indexPath: IndexPath, cell: EventsCollectionViewCellProtocol) {
        let collectionItemName = collectionItems[indexPath.row].name
        cell.configureCell(collectionItem: collectionItemName)
    }
}

