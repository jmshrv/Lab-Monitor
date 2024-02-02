//
//  EntriesListView.swift
//  Lab Monitor
//
//  Created by James on 31/01/2024.
//

import SwiftUI
import TimetableParser

struct EntriesListView: View {
    let entries: [TimetableEntry]
    
    @State var eventHeight = 75.0
    
    private let startHour = 9
    private let endHour = 18
    
    private func eventOffset(eventStart: Int) -> Double {
        var res = Double((eventStart - startHour)) * eventHeight
        
        res += 6
//
//        If we're not the first event, add extra padding
//        if eventStart != startHour {
//            res += 8
//        }
        
        return res
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ZStack {
                    ForEach(startHour...endHour, id: \.self) { hour in
                        HourDivider(hour: hour)
//                            .frame(
//                                height: eventHeight,
//                                alignment: .top
//                            )
                            .offset(y: (Double((hour - startHour)) * eventHeight))
                    }
                }
                ForEach(entries) { entry in
                    TimetableEntryView(entry: entry, height: eventHeight * Double((entry.end.hour - entry.start.hour)))
                        .offset(y: eventOffset(eventStart: entry.start.hour))
                        .padding(.leading, 42)
                        .padding(.trailing, 8)
                }
            }
        }
//        .scrollIndicators(.never)
    }
}

#Preview {
    EntriesListView(entries: [
        .mock
    ])
}
