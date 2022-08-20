//
//  MatchesByDate.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct MatchesByDate: Codable {
    let response: [DataMatchesByDate]
}

struct DataMatchesByDate: Codable {
    let fixture: Fixture
    let league: LeagueData
    let teams: Teams
    let goals: GoalsData
    let score: ScoreData
}

struct Fixture: Codable {
    let id: Int
    let referee: String?
    let timezone: String
    let date: String?
    let timestamp: Int
    let periods: Periods
    let venue: Venue
    let status: Status
}

struct Periods: Codable {
    let first, second: Int?
}

struct Status: Codable {
    let long: String
    let short: String
    let elapsed: Int?
}

struct Venue: Codable {
    let id: Int?
    let name, city: String?
}

struct GoalsData: Codable {
    let home, away: Int?
}

struct LeagueData: Codable {
    let id: Int
    let name, country: String
    let logo: String
    let flag: String?
    let season: Int
    let round: String
}

struct ScoreData: Codable {
    let halftime, fulltime, extratime, penalty: GoalsData
}

struct Teams: Codable {
    let home, away: TeamsInfo
}

struct TeamsInfo: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool?
}



