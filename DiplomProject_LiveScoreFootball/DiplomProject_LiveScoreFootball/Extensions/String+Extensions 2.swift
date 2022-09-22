//
//  String+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 11.09.22.
//

import Foundation
import UIKit

extension String {
    func getDate(_ dateFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.formatPattern
        let inputFormatter = ISO8601DateFormatter()
        inputFormatter.formatOptions = [
            .withFullDate,
            .withFullTime,
            .withTimeZone
        ]
        guard let dateString = inputFormatter.date(from: self) else {return ""}
        return dateFormatter.string(from: dateString)
    }
}
