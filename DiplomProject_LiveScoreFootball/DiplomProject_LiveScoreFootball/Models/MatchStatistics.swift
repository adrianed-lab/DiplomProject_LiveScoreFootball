//
//  MatchStatistics.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation


struct MatchStatistics: Codable {
    let response: [MatchStatisticsData]
}

struct MatchStatisticsData: Codable {
    let team: TeamData
    let statistics: [Statistic]
}

struct Statistic: Codable {
    let type: String
    let value: Int?
}

struct TeamData: Codable {
    let id: Int
    let name: String
    let logo: String
}

