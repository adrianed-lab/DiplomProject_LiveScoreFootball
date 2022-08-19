//
//  AlamofireAPIProvider.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation
import Alamofire
import UIKit

protocol RestAPIProviderProtocol {
    func getCountries(completion: @escaping (Result<DataCountries, Error>) -> Void)
    func getSeasons(completion: @escaping(Result<Seasons, Error>) -> Void)
    func getLeaguesByCountry(countryName: String, completion: @escaping (Result<LeaguesByCountryNameOrSeason, Error>) -> Void)
    func getLeaguesBySeason(seasonYear: Int, completion: @escaping(Result<LeaguesByCountryNameOrSeason, Error>) -> Void)
    func getLeagueTable(seasonYear: Int, leagueId: Int, completion: @escaping (Result<LeagueTable, Error>) -> Void)
    func getTimeZone(completion: @escaping (Result<TimeZone, Error>) -> Void)
    func getLiveMatches(live: String, completion: @escaping (Result<LiveMatches, Error>) -> Void)
    func getMatchesByDate(date: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void)
    func getMatchesByLeague(seasonYear: Int, leagueId: Int, completion: @escaping (Result<MatchesByLeague, Error>) -> Void)
    func getMatchEvents(fixture: Int, completion: @escaping (Result<MatchEvents, Error>) -> Void)
    func getMatchH2H(h2h: String, completion: @escaping (Result<MatchHeadToHead, Error>) -> Void)
    func getMatchLineups(fixture: Int, completion: @escaping (Result<MatchLineups, Error>) -> Void)
    func getMatchStatistics(fixture: Int, completion: @escaping (Result<MatchStatistics, Error>) -> Void)
}

class AlamofireAPIProvider: RestAPIProviderProtocol {
    func getLeaguesBySeason(seasonYear: Int, completion: @escaping (Result<LeaguesByCountryNameOrSeason, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["season": seasonYear.description])
        AF.request(Constants.getLeaguesByCountryNameOrSeason, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: LeaguesByCountryNameOrSeason.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getSeasons(completion: @escaping (Result<Seasons, Error>) -> Void) {
        AF.request(Constants.getSeasons, method: .get, headers: Constants.headers).responseDecodable(of: Seasons.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }

    func getCountries(completion: @escaping (Result<DataCountries, Error>) -> Void) {
        AF.request(Constants.getCountries, method: .get, headers: Constants.headers).responseDecodable(of: DataCountries.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getLeaguesByCountry(countryName: String, completion: @escaping (Result<LeaguesByCountryNameOrSeason, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["country": countryName])
        AF.request(Constants.getLeaguesByCountryNameOrSeason, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: LeaguesByCountryNameOrSeason.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getLeagueTable(seasonYear: Int, leagueId: Int, completion: @escaping (Result<LeagueTable, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["season": seasonYear.description, "league": leagueId.description])
        AF.request(Constants.getLeagueTable, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: LeagueTable.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getTimeZone(completion: @escaping (Result<TimeZone, Error>) -> Void) {
        AF.request(Constants.getTimeZone, method: .get, headers: Constants.headers).responseDecodable(of: TimeZone.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getLiveMatches(live: String, completion: @escaping (Result<LiveMatches, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["live": live])
        AF.request(Constants.getLiveMatches, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: LiveMatches.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchesByDate(date: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["date": date])
        AF.request(Constants.getMatchesByDate, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchesByDate.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchesByLeague(seasonYear: Int, leagueId: Int, completion: @escaping (Result<MatchesByLeague, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["season": seasonYear.description, "league": leagueId.description])
        AF.request(Constants.getMatchesByLeague, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchesByLeague.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchEvents(fixture: Int, completion: @escaping (Result<MatchEvents, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["fixture": fixture.description])
        AF.request(Constants.getMatchEvents, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchEvents.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchH2H(h2h: String, completion: @escaping (Result<MatchHeadToHead, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["h2h": h2h])
        AF.request(Constants.getMatchH2H, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchHeadToHead.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchLineups(fixture: Int, completion: @escaping (Result<MatchLineups, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["fixture": fixture.description])
        AF.request(Constants.getMatchLineups, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchLineups.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchStatistics(fixture: Int, completion: @escaping (Result<MatchStatistics, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["fixture": fixture.description])
        AF.request(Constants.getMatchStatistics, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchStatistics.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    private func addParameters(queryItems: [String : String]) -> [String: String] {
        var parameters: [String: String] = [:]
        parameters = queryItems
        return parameters
    }
}
