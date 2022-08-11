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
        var valueKey = String()
        if let valueAPIkey =  Bundle.main.infoDictionary?["API_KEY"] as? String {
            valueKey = valueAPIkey
        }
        return valueKey
    }
        
    static let headers: HTTPHeaders = [
        "X-RapidAPI-Key" : valueAPIkey,
        "X-RapidAPI-Host" : "livescore-football.p.rapidapi.com"
    ]
    
    static var baseURL = "https://livescore-football.p.rapidapi.com/soccer/"
    static var getCountries: String {
        baseURL.appending("countries")
    }
    static var getLeaguesByCountry: String {
        baseURL.appending("leagues-by-country")
    }
    static var getLeagueTable: String {
        baseURL.appending("league-table")
    }
    static var getTimeZone: String {
        baseURL.appending("timezones")
    }
    static var getLiveMatches: String {
        baseURL.appending("live-matches")
    }
    static var getMatchesByDate: String {
        baseURL.appending("matches-by-date")
    }
    static var getMatchesByLeague: String {
        baseURL.appending("matches-by-league")
    }
    static var getMatchComments: String {
        baseURL.appending("match-commentaries")
    }
    static var getMatchEvents: String {
        baseURL.appending("match-events")
    }
    static var getMatchH2H: String {
        baseURL.appending("match-h2h")
    }
    static var getMatchLineups: String {
        baseURL.appending("match-lineups")
    }
    static var getMatchStatistics: String {
        baseURL.appending("match-statistics")
    }
}
