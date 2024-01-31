//
//  ContentView.swift
//  Lab Monitor
//
//  Created by James on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var entries = ActivityRepository
        .entries[.thursday]!
        .filter {
            $0.weeks.contains {
                $0.isWithin(19)
            } && $0.location.contains(Lab.a32.rawValue)
        }
    
    
    var body: some View {
        List {
            ForEach(entries, id: \.id) { entry in
                VStack(alignment: .leading) {
                    Text(entry.activities.joined(separator: ", "))
                    Text(entry.location)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
