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
        let dayOfWeek = component(.weekday, from: today) - 1
        return range(of: .weekday, in: .weekOfYear, for: today)!
            .compactMap { date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
    }
}
