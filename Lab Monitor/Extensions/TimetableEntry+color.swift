//
//  TimetableEntry+color.swift
//  Lab Monitor
//
//  Created by James on 03/02/2024.
//

import SwiftUI
import TimetableParser

extension TimetableEntry {
    var color: Color {
//        Gets the lowest year of the entry. i.e., dissertation returns 3, since it's both a Y3 and Y4 module.
//        The logic behind this is that labs get emptier in later years (1st year labs are always full)
//        In the future, it would make sense to set a "business" value for each module.
        let minYear = activities
            .compactMap { $0.trimmingPrefix("COMP").first }
            .min()
        
        if minYear == nil {
            return .gray
        }
        
        return switch minYear {
        case "1": .red
        case "2": .orange
        case "3": .yellow
        case "4": .green
        default: .gray
        }
    }
}
