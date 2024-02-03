//
//  Lab.swift
//  Lab Monitor
//
//  Created by James on 31/01/2024.
//

import Foundation

enum Lab: String, CaseIterable, Identifiable, Codable {
    var id: String { rawValue }
    
    case a32 = "A32"
    case a07 = "A07"
    case c11 = "C11"
}
