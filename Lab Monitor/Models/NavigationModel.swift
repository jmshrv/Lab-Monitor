//
//  NavigationModel.swift
//  Lab Monitor
//
//  Created by James on 03/02/2024.
//

import Foundation

@Observable
class NavigationModel: Codable, Equatable {
    var path: [NavigationDestination] = []
    
    static func == (lhs: NavigationModel, rhs: NavigationModel) -> Bool {
        lhs.path == rhs.path
    }
}
