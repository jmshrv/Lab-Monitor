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
    
//    static func entries(for lab: Lab) -> [TimetableEntry] {
//        all.filter { $0.location.contains(lab.rawValue) }
//    }
}
