//
//  LabWeekScreen.swift
//  Lab Monitor
//
//  Created by James on 06/02/2024.
//

import SwiftUI

struct LabWeekScreen: View {
    let lab: Lab
    
    private let weekdays = Calendar.gregorianMonday.daysOfWeek.filter {
        !Calendar.gregorianMonday.isDateInWeekend($0)
    }
    
    private let startHour = 9
    private let endHour = 18
    
    var body: some View {
        GeometryReader { geo in
            let eventHeight = geo.size.height / Double((startHour...endHour).count - 1)
            ZStack(alignment: .topLeading) {
                ForEach(startHour...endHour, id: \.self) { hour in
                    HourDivider(hour: hour)
                        .offset(y: (Double((hour - startHour)) * eventHeight))
                }
                
                HStack {
                    ForEach(weekdays, id: \.timeIntervalSince1970) { day in
                        EntriesListView(entries: ActivityRepository.entries(for: day).filter { $0.location.contains(lab.rawValue) },
                                        showTimeHeader: false)
                    }
                }
                .padding(.leading, 38)
            }
        }
        .padding([.leading, .top, .bottom])
    }
}

#Preview {
    LabWeekScreen(lab: .a32)
}
