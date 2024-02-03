//
//  WeekHeader.swift
//  Lab Monitor
//
//  Created by James on 03/02/2024.
//

import SwiftUI

struct WeekHeader: View {
    let days: [Date]
    @Binding var selectedDay: Date
    
    private let calendar = Calendar.gregorianMonday
    
    var body: some View {
        HStack {
            ForEach(days, id: \.timeIntervalSince1970) { day in
                Spacer()
                DayButton(day: day, isSelected: day == selectedDay) {
                    selectedDay = day
                }
                .animation(.default, value: day == selectedDay)
                Spacer()
            }
        }
    }
}

#Preview {
    WeekHeader(days: Calendar.gregorianMonday.daysOfWeek, selectedDay: .constant(Date()))
}
