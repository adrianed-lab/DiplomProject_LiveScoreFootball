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
    let time: TimeClassMatch
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
    let team1, team2: Team1Union

    enum CodingKeys: String, CodingKey {
        case team1 = "team_1"
        case team2 = "team_2"
    }
}

enum Team1Union: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Team1Union.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Team1_Union"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
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
