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
    let team: Team
    let statistics: [Statistic]
}

struct Statistic: Codable {
    let type: String
    let value: Int?
}

    


