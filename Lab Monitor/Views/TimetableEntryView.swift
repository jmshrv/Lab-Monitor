//
//  TimetableEntryView.swift
//  Lab Monitor
//
//  Created by James on 02/02/2024.
//

import SwiftUI
import TimetableParser

struct TimetableEntryView: View {
    let entry: TimetableEntry
    let height: CGFloat?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("**\(entry.activities.joined(separator: ", "))** - \(entry.sessionTitle)")
            Text(entry.location)
        }
        .padding(.all, 4)
        .frame(
            maxWidth: .infinity,
            alignment: .topLeading
        )
        .frame(
            height: height,
            alignment: .topLeading
        )
        
        .background(.red)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    TimetableEntryView(entry: .mock, height: 50)
}
