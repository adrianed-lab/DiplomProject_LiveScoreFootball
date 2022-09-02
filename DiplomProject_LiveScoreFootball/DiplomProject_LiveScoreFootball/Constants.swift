//
//  Constants.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation
import UIKit
import Alamofire

struct Constants {
    
    static var valueAPIkey: String {
        guard let key = Bundle.main.infoDictionary?["API_KEY"] as? String else {return String()}
        return key
    }
    static let headers: HTTPHeaders = [
        "X-RapidAPI-Key" : valueAPIkey,
        "X-RapidAPI-Host" : "api-football-v1.p.rapidapi.com"
    ]
    
    static var baseURL = "https://api-football-v1.p.rapidapi.com/v3/"
    static var baseURLForCountryImage = "https://media.api-sports.io/flags/"
    static var baseURLForTeamLogo = "https://media.api-sports.io/football/teams/"
    static var teamlogoPrefixURL: String {
        return ".png"
    }
    static var countryImagePrefixURL: String {
        return ".svg"
    }
    static var getCountries: String {
        baseURL.appending("countries")
    }
    static var getSeasons: String {
        baseURL.appending("leagues/seasons")
    }
    static var getLeaguesByCountryNameOrSeason: String {
        baseURL.appending("leagues")
    }
    static var getLeagueTable: String {
        baseURL.appending("standings")
    }
    static var getTimeZone: String {
        baseURL.appending("timezone")
    }
    static var getLiveMatches: String {
        baseURL.appending("fixtures")
    }
    static var getMatchesByDate: String {
        baseURL.appending("fixtures")
    }
    static var getMatchesByLeague: String {
        baseURL.appending("fixtures")
    }
    static var getMatchEvents: String {
        baseURL.appending("fixtures/events")
    }
    static var getMatchH2H: String {
        baseURL.appending("fixtures/headtohead")
    }
    static var getMatchLineups: String {
        baseURL.appending("fixtures/lineups")
    }
    static var getMatchStatistics: String {
        baseURL.appending("fixtures/statistics")
    }
    static var collectionCellState = "State"
    static var currentDate: String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.fullDate.formatPattern
        return dateFormatter.string(from: date)
    }
}

enum DateFormat {
    case fullDate
    case shortDate
    
    var formatPattern: String {
        switch self {
        case .fullDate:
            return "yyyy-MM-dd"
        case .shortDate:
            return "dd.MM."
        }
    }
    
}

