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
    func getLeaguesByCountry(countryName: String, type: String, completion: @escaping (Result<LeaguesByCountryNameOrSeason, Error>) -> Void)
    func getLeaguesBySeason(seasonYear: Int, completion: @escaping(Result<LeaguesByCountryNameOrSeason, Error>) -> Void)
    func getLeagueTable(seasonYear: Int, leagueId: Int, completion: @escaping (Result<LeagueTable, Error>) -> Void)
    func getTimeZone(completion: @escaping (Result<TimeZone, Error>) -> Void)
    func getLiveMatches(live: String, timeZone: String, completion: @escaping (Result<LiveMatches, Error>) -> Void)
    func getMatchesByDate(date: String, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void)
    func getMatchesByLeague(seasonYear: Int, leagueId: Int, last: Int, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void)
    func getFutureMatchesByLeague(seasonYear: Int, leagueId: Int, next: Int, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void)
    func getMatchEvents(fixture: Int, teamId: Int, completion: @escaping (Result<MatchEvents, Error>) -> Void)
    func getMatchH2H(h2h: String, last: Int, completion: @escaping (Result<MatchesByDate, Error>) -> Void)
    func getMatchLineups(fixture: Int, completion: @escaping (Result<MatchLineups, Error>) -> Void)
    func getMatchStatistics(fixture: Int, completion: @escaping (Result<MatchStatistics, Error>) -> Void)
    func getLastMatchesTeamInfo(teamId: Int, countLastMatches: Int, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void)
    func getFutureMatchesTeamInfo(teamId: Int, countFutureMatches: Int, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void)
    func getPlayersByTeamId(teamId: Int, completion: @escaping (Result<PlayersByTeamId, Error>) -> Void)

}

// Класс c реализацией методов отправки запросов по заданным параметрам
class AlamofireAPIProvider: RestAPIProviderProtocol {
    
    static var valueAPIkey: String {
        guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String else {return String()}
        return key
    }
    
    static let headers: HTTPHeaders = [
        "X-RapidAPI-Key" : valueAPIkey,
        "X-RapidAPI-Host" : "api-football-v1.p.rapidapi.com"
    ]
    
    func getPlayersByTeamId(teamId: Int, completion: @escaping (Result<PlayersByTeamId, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["team": teamId.description])
        AF.request(URLConstants.getPlayersByTeamId, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: PlayersByTeamId.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getFutureMatchesTeamInfo(teamId: Int, countFutureMatches: Int, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["team": teamId.description, "next": countFutureMatches.description, "timezone": timeZone])
        AF.request(URLConstants.getMatchesByDate, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchesByDate.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getLastMatchesTeamInfo(teamId: Int, countLastMatches: Int, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["team": teamId.description, "last": countLastMatches.description, "timezone": timeZone ])
        AF.request(URLConstants.getMatchesByDate, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchesByDate.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getLeaguesBySeason(seasonYear: Int, completion: @escaping (Result<LeaguesByCountryNameOrSeason, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["season": seasonYear.description])
        AF.request(URLConstants.getLeaguesByCountryNameOrSeason, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: LeaguesByCountryNameOrSeason.self) { response in
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
        AF.request(URLConstants.getSeasons, method: .get, headers: AlamofireAPIProvider.headers).responseDecodable(of: Seasons.self) { response in
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
        AF.request(URLConstants.getCountries, method: .get, headers: AlamofireAPIProvider.headers).responseDecodable(of: DataCountries.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getLeaguesByCountry(countryName: String, type: String, completion: @escaping (Result<LeaguesByCountryNameOrSeason, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["country": countryName, "type": type])
        AF.request(URLConstants.getLeaguesByCountryNameOrSeason, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: LeaguesByCountryNameOrSeason.self) { response in
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
        AF.request(URLConstants.getLeagueTable, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: LeagueTable.self) { response in
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
        AF.request(URLConstants.getTimeZone, method: .get, headers: AlamofireAPIProvider.headers).responseDecodable(of: TimeZone.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getLiveMatches(live: String, timeZone: String, completion: @escaping (Result<LiveMatches, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["live": live, "timezone":timeZone])
        AF.request(URLConstants.getLiveMatches, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: LiveMatches.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchesByDate(date: String, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["date": date, "timezone": timeZone])
        AF.request(URLConstants.getMatchesByDate, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchesByDate.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getFutureMatchesByLeague(seasonYear: Int, leagueId: Int, next: Int, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["season": seasonYear.description, "league": leagueId.description, "next": next.description, "timezone": timeZone])
        AF.request(URLConstants.getMatchesByLeague, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchesByDate.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }

    }

    func getMatchesByLeague(seasonYear: Int, leagueId: Int, last: Int, timeZone: String, completion: @escaping (Result<MatchesByDate, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["season": seasonYear.description, "league": leagueId.description, "last": last.description, "timezone": timeZone])
        AF.request(URLConstants.getMatchesByLeague, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchesByDate.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchEvents(fixture: Int, teamId: Int,  completion: @escaping (Result<MatchEvents, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["fixture": fixture.description, "team": teamId.description])
        AF.request(URLConstants.getMatchEvents, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchEvents.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
            print(response.result)
        }
    }
    
    func getMatchH2H(h2h: String, last: Int, completion: @escaping (Result<MatchesByDate, Error>) -> Void) {
        let parameters = addParameters(queryItems: ["h2h": h2h, "last": last.description])
        AF.request(URLConstants.getMatchH2H, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchesByDate.self) { response in
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
        AF.request(URLConstants.getMatchLineups, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchLineups.self) { response in
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
        AF.request(URLConstants.getMatchStatistics, method: .get, parameters: parameters, headers: AlamofireAPIProvider.headers).responseDecodable(of: MatchStatistics.self) { response in
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
