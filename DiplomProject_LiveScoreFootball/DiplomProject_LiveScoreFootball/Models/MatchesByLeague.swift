//
//  MatchesByLeague.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct MatchesByLeague: Codable {
    let status: Int
    let data: [DataMatchInfo]
}

struct DataMatchInfo: Codable {
    let round: Int
    let matchID: String
    let status: Status
    let team2: Team1Class
    let lastUpdate: Int
    let team1: Team1Class
    let score: ScoreMatch
    let time: TimeMatch
    let roundInfo: String

    enum CodingKeys: String, CodingKey {
        case round
        case matchID = "match_id"
        case status
        case team2 = "team_2"
        case lastUpdate = "last_update"
        case team1 = "team_1"
        case score, time
        case roundInfo = "round_info"
    }
}

struct ScoreMatch: Codable {
    let fullTime, halfTime: TimeMatch

    enum CodingKeys: String, CodingKey {
        case fullTime = "full_time"
        case halfTime = "half_time"
    }
}

struct TimeMatch: Codable {
    let team1, team2: String?

    enum CodingKeys: String, CodingKey {
        case team1 = "team_1"
        case team2 = "team_2"
    }
}

enum Status: String, Codable {
    case ft = "FT"
    case ns = "NS"
}

struct Team1Class: Codable {
    let country: String
    let name: String
    let id: String
}

struct TimeClassMatch: Codable {
    let scheduled: Int
    let finish: Int?
    let timezone: String
    let start: Int?
}
