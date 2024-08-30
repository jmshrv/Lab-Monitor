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
            ForEach(calendar.daysOfWeek, id: \.timeIntervalSince1970) { day in
                EntriesListView(
                    entries: ActivityRepository.entries(for: day).filter { $0.location.contains(lab.rawValue) },
                    showTimeHeader: true)
                .tag(day)
                .safeAreaPadding()
                    
            }
        }
        #if !os(macOS)
        .tabViewStyle(.page(indexDisplayMode: .never))
        #endif
        .navigationTitle(lab.rawValue)
        #if !os(macOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
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
