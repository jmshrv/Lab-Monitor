//
//  Calendar+gregorianMonday.swift
//  Lab Monitor
//
//  Created by James on 03/02/2024.
//

import Foundation

extension Calendar {
    static var gregorianMonday: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2
        
        return calendar
    }
}
