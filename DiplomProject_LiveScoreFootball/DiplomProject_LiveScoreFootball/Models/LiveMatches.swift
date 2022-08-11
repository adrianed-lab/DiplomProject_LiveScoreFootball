//
//  LiveMatches.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct LiveMatches: Codable {
    let status: Int
    let data: [DataMatch]
}

struct DataMatch: Codable {
    let leagueID: String
    let matches: [Match]
    let leagueName, countryID, leagueCode, countryCode: String
    let countryName: String

    enum CodingKeys: String, CodingKey {
        case leagueID = "league_id"
        case matches
        case leagueName = "league_name"
        case countryID = "country_id"
        case leagueCode = "league_code"
        case countryCode = "country_code"
        case countryName = "country_name"
    }
}

struct Match: Codable {
    let round: Int
    let matchID, status: String
    let team2: Team
    let lastUpdate: Int?
    let team1: Team
    let score: Score
    let time: TimeClass
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

struct Score: Codable {
    let fullTime, halfTime: Time

    enum CodingKeys: String, CodingKey {
        case fullTime = "full_time"
        case halfTime = "half_time"
    }
}

struct Time: Codable {
    let team1, team2: String

    enum CodingKeys: String, CodingKey {
        case team1 = "team_1"
        case team2 = "team_2"
    }
}

struct Team: Codable {
    let country, name, id: String
}

struct TimeClass: Codable {
    let scheduled: Int
    let finish: Int?
    let timezone: String
    let start: Int?
}
