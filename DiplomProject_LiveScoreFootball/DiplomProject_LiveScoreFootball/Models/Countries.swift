//
//  Models.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 10.08.22.
//

import Foundation


struct DataCountries: Codable {
    let response: [CountryInfo]
}

struct CountryInfo: Codable {
    let name: String
    let code: String?
    let flag: String?
}

struct Seasons: Codable {
    let dataSeasons: [Int]
}



