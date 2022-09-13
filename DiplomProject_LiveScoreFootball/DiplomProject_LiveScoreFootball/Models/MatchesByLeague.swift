//
//  MatchesByLeague.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct MatchesByLeague: Codable {
    let response: [DataMatchesByLeague]
}

struct DataMatchesByLeague: Codable {
    let fixture: FixtureDataByLeague
    let league: InfoByLeagueID
    let teams: HomeAwayByLeague
    let goals: DataGoals
    let score: DataScore
}

struct FixtureDataByLeague: Codable {
    let id: Int
    let referee: String?
    let timezone: String
    let date: String?
    let timestamp: Int
    let periods: DataPeriods
    let venue: DataVenue
    let status: DataStatus
}

struct DataPeriods: Codable {
    let first, second: Int?
}

struct DataStatus: Codable {
    let long: String
    let short: String
    let elapsed: Int?
}

struct DataVenue: Codable {
    let id: Int?
    let name: String?
    let city: String?
}

struct DataGoals: Codable {
    let home, away: Int?
}

struct HomeAwayByLeague: Codable {
    let home, away: AwayClass
}

struct AwayClass: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool?
}

struct InfoByLeagueID: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
    let round: String
}

struct DataScore: Codable {
    let halftime, fulltime, extratime, penalty: DataGoals
}
