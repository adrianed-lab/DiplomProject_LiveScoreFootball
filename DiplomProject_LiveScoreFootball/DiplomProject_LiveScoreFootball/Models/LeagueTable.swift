//
//  LeagueTable.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct LeagueTable: Codable {
    let response: [Response]
}
struct Response: Codable {
    let league: LeagueInfo
}

struct LeagueInfo: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String?
    let season: Int
    let standings: [[Standing]]
}

struct Standing: Codable {
    let rank: Int
    let team: Team
    let points, goalsDiff: Int
    let group: String
    let form: String?
    let status: String
    let standingDescription: String?
    let all, home, away: All
    let update: String?

    enum CodingKeys: String, CodingKey {
        case rank, team, points, goalsDiff, group, form, status
        case standingDescription = "description"
        case all, home, away, update
    }
}

struct All: Codable {
    let played, win, draw, lose: Int?
    let goals: Goals
}

struct Goals: Codable {
    let goalsFor, against: Int?

    enum CodingKeys: String, CodingKey {
        case goalsFor = "for"
        case against
    }
}

struct Team: Codable {
    let id: Int
    let name: String
    let logo: String
}

