//
//  LiveMatches.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation


struct LiveMatches: Codable {
    let response: [DataLiveFixtures]
}

struct DataLiveFixtures: Codable {
    let fixture: DataFixture
    let league: DataLeagueInfo
    let teams: TeamLiveInfo
    let goals: GoalsInfo
    let score: ScoreInfo
    let events: [Event]
}

struct Event: Codable {
    let time: TimeInfo
    let team: TeamInfo
    let player, assist: Assist
    let type: String
    let detail: String
    let comments: String?
}

struct Assist: Codable {
    let id: Int?
    let name: String?
}

struct TeamInfo: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool?
}

struct TimeInfo: Codable {
    let elapsed: Int
    let extra: Int?
}

struct DataFixture: Codable {
    let id: Int
    let referee: String?
    let timezone: String
    let date: String?
    let timestamp: Int
    let periods: PeriodsInfo
    let venue: VenueInfo
    let status: StatusInfo
}

struct PeriodsInfo: Codable {
    let first: Int?
    let second: Int?
}

struct StatusInfo: Codable {
    let long: String
    let short: String
    let elapsed: Int?
}

struct VenueInfo: Codable {
    let id: Int?
    let name, city: String?
}

struct TeamLiveInfo: Codable {
    let home, away: TeamInfo
}

struct GoalsInfo: Codable {
    let home, away: Int?
}

struct DataLeagueInfo: Codable {
    let id: Int
    let name, country: String
    let logo: String
    let flag: String?
    let season: Int
    let round: String
}

struct ScoreInfo: Codable {
    let halftime, fulltime, extratime, penalty: GoalsInfo
}



