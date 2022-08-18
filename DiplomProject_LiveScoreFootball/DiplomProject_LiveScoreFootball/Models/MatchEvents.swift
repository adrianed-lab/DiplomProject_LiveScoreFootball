//
//  MatchEvents.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct MatchEvents: Codable {
    let response: [DataMatchEvent]
}

struct DataMatchEvent: Codable {
    let time: TimeEvent
    let team: TeamEvent
    let player, assist: AssistEvent
    let type: String
    let detail: String
    let comments: String?
}

struct AssistEvent: Codable {
    let id: Int?
    let name: String?
}

struct TeamEvent: Codable {
    let id: Int
    let name: String
    let logo: String
}

struct TimeEvent: Codable {
    let elapsed: Int
    let extra: Int?
}


