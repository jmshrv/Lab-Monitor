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
    
//    @State var eventHeight = 75.0
    
    private let startHour = 9
    private let endHour = 18
    
    private func eventOffset(_ eventStart: Int, _ eventHeight: CGFloat) -> Double {
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
        GeometryReader { geo in
            let eventHeight = geo.size.height / Double((startHour...endHour).count - 1)
            
            ZStack(alignment: .topLeading) {
                ZStack(alignment: .topLeading) {
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
                    TimetableEntryTile(entry: entry, height: eventHeight * Double((entry.end.hour - entry.start.hour)))
                        .offset(y: eventOffset(entry.start.hour, eventHeight) + 2)
                        .padding(.leading, 42)
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
