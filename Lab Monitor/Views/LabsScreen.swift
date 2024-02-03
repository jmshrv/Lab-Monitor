//
//  LabsScreen.swift
//  Lab Monitor
//
//  Created by James on 02/02/2024.
//

import SwiftUI

struct LabsScreen: View {
    var body: some View {
        List(Lab.allCases) { lab in
            NavigationLink(lab.rawValue, value: NavigationDestination.labCalendar(lab))
        }
        .navigationTitle("Labs")
    }
}

#Preview {
    LabsScreen()
}
