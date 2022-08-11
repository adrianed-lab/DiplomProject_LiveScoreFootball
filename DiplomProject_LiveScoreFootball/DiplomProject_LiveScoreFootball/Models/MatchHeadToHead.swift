//
//  MatchHeadToHead.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation


struct MatchH2H: Codable {
    let status: Int
    let data: DataH2H
}

struct DataH2H: Codable {
    let team1: DataTeam
    let h2H: H2H
    let team2: DataTeam

    enum CodingKeys: String, CodingKey {
        case team1 = "team_1"
        case h2H = "h2h"
        case team2 = "team_2"
    }
}

struct H2H: Codable {
    let lastMatches: [LastMatch]

    enum CodingKeys: String, CodingKey {
        case lastMatches = "last_matches"
    }
}

struct LastMatch: Codable {
    let leagueName: String
    let team1, team2: LastMatchTeam
    let matchDate: Int
    let score: ScoreLastMatch
    let countryName: String
    let leagueID: String?
    let countryCode: String?

    enum CodingKeys: String, CodingKey {
        case leagueName = "league_name"
        case team1 = "team_1"
        case team2 = "team_2"
        case matchDate = "match_date"
        case score
        case countryName = "country_name"
        case leagueID = "league_id"
        case countryCode = "country_code"
    }
}

struct ScoreLastMatch: Codable {
    let team1, team2: String

    enum CodingKeys: String, CodingKey {
        case team1 = "team_1"
        case team2 = "team_2"
    }
}

struct LastMatchTeam: Codable {
    let name: String
    let countryName: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case name
        case countryName = "country_name"
        case id
    }
}

struct DataTeam: Codable {
    let lastMatches: [LastMatch]
    let name, id: String

    enum CodingKeys: String, CodingKey {
        case lastMatches = "last_matches"
        case name, id
    }
}
