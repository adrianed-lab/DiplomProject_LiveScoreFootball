//
//  PlayersByLeagueID.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 7.09.22.
//

import Foundation

struct PlayersByTeamId: Codable {
    let response: [PlayersData]
}

struct PlayersData: Codable {
    let team: PlayerTeam
    let players: [PlayerInfo]
}

struct PlayerInfo: Codable {
    let id: Int
    let name: String
    let age: Int?
    let number: Int?
    let position: Position
    let photo: String
}

enum Position: String, Codable {
    case attacker = "Attacker"
    case defender = "Defender"
    case goalkeeper = "Goalkeeper"
    case midfielder = "Midfielder"
}

struct PlayerTeam: Codable {
    let id: Int
    let name: String
    let logo: String
}
