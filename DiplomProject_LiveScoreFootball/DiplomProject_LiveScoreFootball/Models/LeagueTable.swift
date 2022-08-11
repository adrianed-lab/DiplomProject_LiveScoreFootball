//
//  LeagueTable.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation


struct LeagueTable: Codable {
    let status: Int
    let data: DataStatistics
}

struct DataStatistics: Codable {
    let total, home, away: [Statistics]
}

struct Statistics: Codable {
    let draw, won, lost: Int
    let teamName: String
    let points, goalsDiff, goalsFor: Int
    let teamID: String
    let rank, goalsAgainst, gamesPlayed: Int

    enum CodingKeys: String, CodingKey {
        case draw, won, lost
        case teamName = "team_name"
        case points
        case goalsDiff = "goals_diff"
        case goalsFor = "goals_for"
        case teamID = "team_id"
        case rank
        case goalsAgainst = "goals_against"
        case gamesPlayed = "games_played"
    }
}
