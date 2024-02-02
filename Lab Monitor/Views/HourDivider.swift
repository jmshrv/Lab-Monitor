//
//  HourDivider.swift
//  Lab Monitor
//
//  Created by James on 02/02/2024.
//

import SwiftUI

struct HourDivider: View {
    let hour: Int
    
    private var hourString: String {
        String(format: "%02d", hour)
    }
    
    var body: some View {
        HStack {
            Text("\(hourString):00")
                .foregroundStyle(.secondary)
                .font(.caption)
                .bold()
                .monospacedDigit()
//            Bit of a hack, but I want the divider to be horizontal
            VStack {
                Divider()
            }
        }
        .accessibilityHidden(true)
    }
}

#Preview {
    HourDivider(hour: 2)
}
