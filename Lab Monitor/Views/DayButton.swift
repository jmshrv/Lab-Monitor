//
//  DayButton.swift
//  Lab Monitor
//
//  Created by James on 03/02/2024.
//

import SwiftUI

struct DayButton: View {
    let day: Date
    let isSelected: Bool
    let action: () -> Void
    
    private let calendar = Calendar.gregorianMonday
    
    private var symbol: String {
        let dayOfWeekIndex = calendar.component(.weekday, from: day) - 1
        
        guard dayOfWeekIndex < calendar.veryShortWeekdaySymbols.count else {
            return "?"
        }
        
        return calendar.veryShortWeekdaySymbols[dayOfWeekIndex]
    }
    
    private var dayNumber: Int {
        return calendar.component(.day, from: day)
    }
    
    var body: some View {
        VStack {
            Text(symbol)
                .foregroundStyle(calendar.isDateInWeekend(day) ? .secondary : .primary)
                .font(.caption)
            Button("\(dayNumber)", action: action)
                .frame(width: 30, height: 30)
                .foregroundStyle(.primary)
                .background(isSelected ? Color.red : nil)
                .clipShape(Circle())
        }
    }
}

#Preview {
    DayButton(day: Date(), isSelected: false) {}
}
