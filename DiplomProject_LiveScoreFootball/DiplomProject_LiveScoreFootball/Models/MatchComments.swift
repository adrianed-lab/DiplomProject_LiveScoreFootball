//
//  MatchComments.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.08.22.
//

import Foundation

struct MatchComments: Codable {
    let status: Int
    let data: [DataComments]
}

struct DataComments: Codable {
    let minEx, min: Int?
    let txt: String

    enum CodingKeys: String, CodingKey {
        case minEx = "MinEx"
        case min = "Min"
        case txt = "Txt"
    }
}
