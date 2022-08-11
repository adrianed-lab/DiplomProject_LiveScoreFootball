//
//  MatchesByDate.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct MatchesByDate: Codable {
    let status: Int
    let data: [DataMatches]
}

struct DataMatches: Codable {
    let leagueID: String
    let matches: [MatchInfo]
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

struct MatchInfo: Codable {
    let round: Int
    let matchID, status: String
    let team2: TeamInfo
    let lastUpdate: Int
    let team1: TeamInfo
    let score: ScoreInfo
    let time: TimeClassInfo
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

struct ScoreInfo: Codable {
    let fullTime, halfTime: TimeInfo

    enum CodingKeys: String, CodingKey {
        case fullTime = "full_time"
        case halfTime = "half_time"
    }
}

struct TimeInfo: Codable {
    let team1, team2: Int

    enum CodingKeys: String, CodingKey {
        case team1 = "team_1"
        case team2 = "team_2"
    }
}

struct TeamInfo: Codable {
    let country: String
    let name, id: String
}

struct TimeClassInfo: Codable, Hashable {
    let scheduled: Int
    let finish: JSONNull?
    let timezone: String
    let start: JSONNull?
}


class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
