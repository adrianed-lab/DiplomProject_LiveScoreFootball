//
//  MatchLineups.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation


struct MatchLineups: Codable {
    let status: Int
    let data: DataLineups
}

struct DataLineups: Codable {
    let team1: DataTeamInfo
    let substitution: [Substitution]
    let team2: DataTeamInfo

    enum CodingKeys: String, CodingKey {
        case team1 = "team_1"
        case substitution
        case team2 = "team_2"
    }
}

struct Substitution: Codable {
    let idOpposite: String
    let sort: Int
    let id: String
    let inOut: InOut
    let playerName: String
    let minute: Int
    let team: TeamEnum

    enum CodingKeys: String, CodingKey {
        case idOpposite = "id_opposite"
        case sort, id
        case inOut = "in_out"
        case playerName = "player_name"
        case minute, team
    }
}

enum InOut: String, Codable {
    case inOutIN = "IN"
    case out = "OUT"
}

enum TeamEnum: String, Codable {
    case team1 = "team_1"
    case team2 = "team_2"
}

struct DataTeamInfo: Codable {
    let players, substitutePlayers: [Player]
    let id, formation, name: String
    let coach: [Coach]

    enum CodingKeys: String, CodingKey {
        case players
        case substitutePlayers = "substitute_players"
        case id, formation, name, coach
    }
}

struct Coach: Codable {
    let firstName, lastName, id: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id
    }
}

struct Player: Codable {
    let firstName: String?
    let lastName, id: String
    let positionName: PositionName
    let position: Int
    let positionFormation: String?
    let shirtNumber: Int

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id
        case positionName = "position_name"
        case position
        case positionFormation = "position_formation"
        case shirtNumber = "shirt_number"
    }
}

enum PositionName: String, Codable {
    case defender = "DEFENDER"
    case forward = "FORWARD"
    case goalkeeper = "GOALKEEPER"
    case midfielder = "MIDFIELDER"
    case substitutePlayer = "SUBSTITUTE_PLAYER"
}
