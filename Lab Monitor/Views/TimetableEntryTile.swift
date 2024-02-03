//
//  TimetableEntryTile.swift
//  Lab Monitor
//
//  Created by James on 02/02/2024.
//

import SwiftUI
import TimetableParser

struct TimetableEntryTile: View {
    let entry: TimetableEntry
    let height: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("**\(entry.activities.joined(separator: ", "))** - \(entry.sessionTitle)")
//            Text(entry.location)
            Text(entry.type)
        }
        .padding(.all, 4)
        .frame(
            maxWidth: .infinity,
            alignment: .topLeading
        )
        .frame(
            height: height - 2, // Add a little bit of padding
            alignment: .topLeading
        )
        
        .background(entry.color)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    TimetableEntryTile(entry: .mock, height: 50)
}
