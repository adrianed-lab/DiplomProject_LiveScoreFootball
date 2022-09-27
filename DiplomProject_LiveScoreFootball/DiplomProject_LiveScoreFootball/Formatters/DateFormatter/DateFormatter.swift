//
//  DateFormatter.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 25.09.22.
//

import Foundation

struct DateStruct {
    static var currentDate: String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.middleDate.formatPattern
        return dateFormatter.string(from: date)
    }
}

enum DateFormat {
    case fullDate
    case middleDate
    case shortDate
    case startTime
    
    var formatPattern: String {
        switch self {
        case .fullDate:
            return "MM.dd.yyyy HH:mm"
        case.middleDate:
            return "yyyy-MM-dd"
        case .shortDate:
            return "dd.MM."
        case .startTime:
            return "HH:mm"
        }
    }
}
