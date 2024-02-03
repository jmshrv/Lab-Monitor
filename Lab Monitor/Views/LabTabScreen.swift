//
//  LabTabScreen.swift
//  Lab Monitor
//
//  Created by James on 02/02/2024.
//

import SwiftUI

struct LabTabScreen: View {
    let lab: Lab
    
    private let calendar = Calendar(identifier: .gregorian)
    
    var body: some View {
        TabView {
            EntriesListView(entries: ActivityRepository.entries(for: calendar.date(byAdding: .day, value: -1, to: Date())!).filter { $0.location.contains(lab.rawValue) })
            EntriesListView(entries: ActivityRepository.entries(for: Date()).filter { $0.location.contains(lab.rawValue) })
            EntriesListView(entries: ActivityRepository.entries(for: calendar.date(byAdding: .day, value: 1, to: Date())!).filter { $0.location.contains(lab.rawValue) })
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .navigationTitle(lab.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .top) {
            Text("Hi!")
        }
    }
}

#Preview {
    LabTabScreen(lab: .a32)
}
