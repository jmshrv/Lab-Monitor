//
//  ActivityRepository.swift
//  Lab Monitor
//
//  Created by James on 31/01/2024.
//

import Foundation
import TimetableParser

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

struct ActivityRepository {
    static let year1: [Day: [TimetableEntry]] = try! NSDataAsset(name: "year1")!.decode()
    static let year2: [Day: [TimetableEntry]] = try! NSDataAsset(name: "year2")!.decode()
    static let year3: [Day: [TimetableEntry]] = try! NSDataAsset(name: "year3")!.decode()
    static let year4: [Day: [TimetableEntry]] = try! NSDataAsset(name: "year4")!.decode()
    
    static let entries = year1
        .merging(year2) { a, b in a + b }
        .merging(year3) { a, b in a + b }
        .merging(year4) { a, b in a + b }
    
    private static var yearStart: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: DateComponents(year: 2023, month: 9, day: 25))!
    }
    
//    static func entries(for lab: Lab) -> [TimetableEntry] {
//        all.filter { $0.location.contains(lab.rawValue) }
//    }
    
    /// Gets timetable entries for the given date.
    static func entries(for date: Date) -> [TimetableEntry] {
        let timeIntervalSinceStart = yearStart.distance(to: date)
        
//        Seconds to weeks
        let weeks = Int(timeIntervalSinceStart / 604800) + 1
        
        print(weeks)
        
        let calendarDay = Calendar(identifier: .gregorian).dateComponents([.weekday], from: date)
        
        let day: Day? = switch calendarDay.weekday {
        case 1: .monday
        case 2: .tuesday
        case 3: .wednesday
        case 4: .thursday
        case 5: .friday
        default: nil
        }
        
//        We don't care about saturday/sunday
        guard day != nil else {
            return []
        }
        
        let returned = entries[day!]!.filter { entry in
            entry.weeks.contains {
                $0.isWithin(weeks)
            }
        }
        
        return returned
    }
}
