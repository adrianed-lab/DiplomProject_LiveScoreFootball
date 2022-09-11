//
//  MatchHeadToHead.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation


struct MatchHeadToHead: Codable {
    let response: [DataMatchH2H]
}

struct DataMatchH2H: Codable {
    let fixture: FixtureH2H
    let league: LeagueH2H
    let teams: HomeAway
    let goals: GoalsH2H
    let score: ScoreH2H
}

struct FixtureH2H: Codable {
    let id: Int
    let referee: String?
    let timezone: String
    let date: String?
    let timestamp: Int
    let periods: PeriodsH2H
    let venue: VenueH2H
    let status: StatusH2H
}

struct PeriodsH2H: Codable {
    let first, second: Int?
}

struct StatusH2H: Codable {
    let long: String
    let short: String
    let elapsed: Int?
}

struct VenueH2H: Codable {
    let id: Int?
    let name: String?
    let city: String?
}

struct GoalsH2H: Codable {
    let home, away: Int?
}

struct HomeAway: Codable {
    let home, away: AwayClassH2H
}

struct AwayClassH2H: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool?
}

struct LeagueH2H: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String?
    let season: Int
    let round: String
}

struct ScoreH2H: Codable {
    let halftime, fulltime, extratime, penalty: GoalsH2H
}

