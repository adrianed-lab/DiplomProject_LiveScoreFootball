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
    func getLeaguesByCountry(countryCode: String, completion: @escaping (Result<DataLeagues, Error>) -> Void)
    func getLeagueTable(countryCode: String, leagueCode: String, completion: @escaping (Result<LeagueTable, Error>) -> Void)
    func getTimeZone(completion: @escaping (Result<TimeZone, Error>) -> Void)
    func getLiveMatches(timeZone: String, completion: @escaping (Result<LiveMatches, Error>) -> Void)
    func getMatchesByDate(date: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void)
    func getMatchesByLeague(countryCode: String, leagueCode: String, timeZone: String, round: String, completion: @escaping (Result<MatchesByLeague, Error>) -> Void)
    func getMatchComments(matchId: Int, completion: @escaping (Result<MatchComments, Error>) -> Void)
    func getMatchEvents(matchId: Int, completion: @escaping (Result<MatchEvents, Error>) -> Void)
    func getMatchH2H(matchId: Int, completion: @escaping (Result<MatchH2H, Error>) -> Void)
    func getMatchLineups(matchId: Int, completion: @escaping (Result<MatchLineups, Error>) -> Void)
    func getMatchStatistics(matchId: Int, completion: @escaping (Result<MatchStatistics, Error>) -> Void)
}

class AlamofireAPIProvider: RestAPIProviderProtocol {
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
    
    func getLeaguesByCountry(countryCode: String, completion: @escaping (Result<DataLeagues, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["country_code": countryCode])
        AF.request(Constants.getLeaguesByCountry, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: DataLeagues.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getLeagueTable(countryCode: String, leagueCode: String, completion: @escaping (Result<LeagueTable, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["country_code": countryCode, "league_code": leagueCode])
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
    
    func getLiveMatches(timeZone: String, completion: @escaping (Result<LiveMatches, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["timezone_utc": timeZone])
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
        AF.request(Constants.getLiveMatches, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchesByDate.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchesByLeague(countryCode: String, leagueCode: String, timeZone: String, round: String, completion: @escaping (Result<MatchesByLeague, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["timezone_utc": timeZone, "country_code": countryCode, "league_code": leagueCode, "round": round])
        AF.request(Constants.getLiveMatches, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchesByLeague.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchComments(matchId: Int, completion: @escaping (Result<MatchComments, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["match_id": matchId.description])
        AF.request(Constants.getLiveMatches, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchComments.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchEvents(matchId: Int, completion: @escaping (Result<MatchEvents, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["match_id": matchId.description])
        AF.request(Constants.getLiveMatches, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchEvents.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchH2H(matchId: Int, completion: @escaping (Result<MatchH2H, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["match_id": matchId.description])
        AF.request(Constants.getLiveMatches, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchH2H.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchLineups(matchId: Int, completion: @escaping (Result<MatchLineups, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["match_id": matchId.description])
        AF.request(Constants.getLiveMatches, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchLineups.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchStatistics(matchId: Int, completion: @escaping (Result<MatchStatistics, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["match_id": matchId.description])
        AF.request(Constants.getLiveMatches, method: .get, parameters: parameters, headers: Constants.headers).responseDecodable(of: MatchStatistics.self) { response in
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
