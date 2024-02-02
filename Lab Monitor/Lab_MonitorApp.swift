//
//  Lab_MonitorApp.swift
//  Lab Monitor
//
//  Created by James on 31/01/2024.
//

import SwiftUI

@main
struct Lab_MonitorApp: App {
    let calendar = Calendar(identifier: .gregorian)
    
    var body: some Scene {
        WindowGroup {
            TabView {
                EntriesListView(entries: ActivityRepository.entries(for: calendar.date(byAdding: .day, value: -1, to: Date())!).filter { $0.location.contains("A32") })
                EntriesListView(entries: ActivityRepository.entries(for: Date()).filter { $0.location.contains("A32") })
                EntriesListView(entries: ActivityRepository.entries(for: calendar.date(byAdding: .day, value: 1, to: Date())!).filter { $0.location.contains("A32") })
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}
