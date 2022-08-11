//
//  MatchEvents.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct MatchEvents: Codable {
    let status: Int
    let data: [EventsInfo]
}

struct EventsInfo: Codable {
    let minute: Int
    let event: Event?
    let playerName: String?
    let sort: Int
    let score: [Int]?
    let id: String?
    let team: Int
    let events: [EventsInfo]?

    enum CodingKeys: String, CodingKey {
        case minute, event
        case playerName = "player_name"
        case sort, score, id, team, events
    }
}

enum Event: String, Codable {
    case goal = "GOAL"
    case goalAssist = "GOAL_ASSIST"
    case yellowCard = "YELLOW_CARD"
}
