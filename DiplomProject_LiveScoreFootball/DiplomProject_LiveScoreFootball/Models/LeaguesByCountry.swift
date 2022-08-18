//
//  LeaguesByCountry.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 10.08.22.
//

import Foundation


struct LeaguesByCountryName: Codable {
    let response: [DataLeague]
}

struct DataLeague: Codable {
    let league: League
    let country: Country
    let seasons: [Season]
}

struct Country: Codable {
    let name: String
    let code: String?
    let flag: String?
}

struct League: Codable {
    let id: Int
    let name: String
    let type: TypeEnum
    let logo: String
}

enum TypeEnum: String, Codable {
    case cup = "Cup"
    case league = "League"
}

struct Season: Codable {
    let year: Int
    let start, end: String
    let current: Bool
    let coverage: Coverage
}

struct Coverage: Codable {
    let fixtures: Fixtures
    let standings, players, topScorers, topAssists: Bool
    let topCards, injuries, predictions, odds: Bool

    enum CodingKeys: String, CodingKey {
        case fixtures, standings, players
        case topScorers = "top_scorers"
        case topAssists = "top_assists"
        case topCards = "top_cards"
        case injuries, predictions, odds
    }
}

struct Fixtures: Codable {
    let events, lineups, statisticsFixtures, statisticsPlayers: Bool

    enum CodingKeys: String, CodingKey {
        case events, lineups
        case statisticsFixtures = "statistics_fixtures"
        case statisticsPlayers = "statistics_players"
    }
}

