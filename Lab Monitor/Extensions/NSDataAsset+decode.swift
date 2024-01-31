//
//  NSDataAsset+decode.swift
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

extension NSDataAsset {
    func decode() throws -> [Day: [TimetableEntry]] {
        let decoder = JSONDecoder()
        
        let data = try decoder.decode([[TimetableEntry]].self, from: self.data)
        
        guard data.count == 5 else {
            fatalError("Invalid data count!")
        }
        
        return [
            .monday: data[0],
            .tuesday: data[1],
            .wednesday: data[2],
            .thursday: data[3],
            .friday: data[4]
        ]
    }
}
