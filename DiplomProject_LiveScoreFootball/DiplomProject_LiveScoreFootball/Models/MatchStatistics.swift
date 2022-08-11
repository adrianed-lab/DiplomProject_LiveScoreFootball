//
//  MatchStatistics.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation


struct MatchStatistics: Codable {
    let status: Int
    let data: TeamsStatistics
}

struct TeamsStatistics: Codable {
    let team1, team2: StatisticsInfo

    enum CodingKeys: String, CodingKey {
        case team1 = "team_1"
        case team2 = "team_2"
    }
}

struct StatisticsInfo: Codable {
    let offsides, shotsOffTarget, possesion, counterAttacks: Int
    let fouls, shotsOnTarget, redCards, goalKicks: Int
    let yellowCards: Int
    let name: String
    let goalkeeperSaves, corners: Int
    let scoreHalf1: String
    let shotsBlocked: Int
    let id: String
    let crosses: Int
    let score: String
    let treatments, throwIns: Int

    enum CodingKeys: String, CodingKey {
        case offsides
        case shotsOffTarget = "shots_off_target"
        case possesion
        case counterAttacks = "counter_attacks"
        case fouls
        case shotsOnTarget = "shots_on_target"
        case redCards = "red_cards"
        case goalKicks = "goal_kicks"
        case yellowCards = "yellow_cards"
        case name
        case goalkeeperSaves = "goalkeeper_saves"
        case corners
        case scoreHalf1 = "score_half_1"
        case shotsBlocked = "shots_blocked"
        case id, crosses, score, treatments
        case throwIns = "throw_ins"
    }
}
