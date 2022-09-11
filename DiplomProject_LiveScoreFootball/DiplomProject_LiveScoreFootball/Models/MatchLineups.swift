//
//  MatchLineups.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation


struct MatchLineups: Codable {
    let response: [DataMatchLineups]
}

struct DataMatchLineups: Codable {
    let team: TeamInfoLineups
    let coach: Coach
    let formation: String?
    let startXI, substitutes: [StartXi]
}

struct Coach: Codable {
    let id: Int?
    let name: String?
    let photo: String?
}

struct StartXi: Codable {
    let player: Player
}

struct Player: Codable {
    let id: Int
    let name: String
    let number: Int?
    let pos: String?
    let grid: String?
}

struct TeamInfoLineups: Codable {
    let id: Int
    let name: String?
    let logo: String?
    let colors: Colors?
}


struct Colors: Codable {
    let player, goalkeeper: Goalkeeper
}

struct Goalkeeper: Codable {
    let primary, number, border: String
}

