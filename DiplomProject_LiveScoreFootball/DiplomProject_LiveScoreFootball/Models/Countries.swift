//
//  Models.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 10.08.22.
//

import Foundation

struct DataCountries: Codable {
    let status: Int
    let data: [Countries]
}

struct Countries: Codable {
    let countryID: String?
    let countryCode: String
    let countryName: String

    enum CodingKeys: String, CodingKey {
        case countryID = "country_id"
        case countryCode = "country_code"
        case countryName = "country_name"
    }
}


