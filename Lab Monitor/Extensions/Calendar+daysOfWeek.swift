//
//  Calendar+daysOfWeek.swift
//  Lab Monitor
//
//  Created by James on 03/02/2024.
//

import Foundation

extension Calendar {
    var daysOfWeek: [Date] {
        let today = startOfDay(for: Date())
        var dayOfWeek = component(.weekday, from: today) - 1
        
//        Awkwardly work around the whole "weekdays start on Sunday" thing
//        Surely there's a way to start the week on Monday in Swift???
        if dayOfWeek == 0 {
            dayOfWeek = 7
        }
        
        return range(of: .weekday, in: .weekOfYear, for: today)!
            .compactMap { date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
    }
}
