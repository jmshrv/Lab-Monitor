//
//  MockTimetableEntry.swift
//  Lab Monitor
//
//  Created by James on 02/02/2024.
//

import Foundation
import TimetableParser

extension TimetableEntry {
    static var mock: TimetableEntry {
        .init(
            activities: ["COMP3000", "COMP4000"],
            moduleTitle: "Mock",
            sessionTitle: "Mock",
            type: "Lab",
            weeks: [.range(1, 52)],
            day: .monday,
            start: .init(hour: 10, minute: 0),
            end: .init(hour: 11, minute: 0),
            staff: "Dr Mock",
            location: "A32",
            notes: nil
        )
    }
}
