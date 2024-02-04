//
//  LabTabScreen.swift
//  Lab Monitor
//
//  Created by James on 02/02/2024.
//

import SwiftUI

struct LabTabScreen: View {
    let lab: Lab
    
    private let calendar = Calendar.gregorianMonday
    
    @State private var tabIndex = Calendar.gregorianMonday.startOfDay(for: Date())
    
    var body: some View {
        TabView(selection: $tabIndex) {
//            EntriesListView(entries: ActivityRepository.entries(for: calendar.date(byAdding: .day, value: -1, to: Date())!).filter { $0.location.contains(lab.rawValue) })
//            EntriesListView(entries: ActivityRepository.entries(for: Date()).filter { $0.location.contains(lab.rawValue) })
//            EntriesListView(entries: ActivityRepository.entries(for: calendar.date(byAdding: .day, value: 1, to: Date())!).filter { $0.location.contains(lab.rawValue) })
            ForEach(calendar.daysOfWeek, id: \.timeIntervalSince1970) { day in
                EntriesListView(entries: ActivityRepository.entries(for: day).filter { $0.location.contains(lab.rawValue) })
                    .tag(day)
                    .safeAreaPadding()
                    
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .navigationTitle(lab.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .top) {
            WeekHeader(days: calendar.daysOfWeek, selectedDay: $tabIndex)
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    NavigationStack {
        LabTabScreen(lab: .a32)
    }
}
