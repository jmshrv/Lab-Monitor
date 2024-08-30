//
//  LabsScreen.swift
//  Lab Monitor
//
//  Created by James on 02/02/2024.
//

import SwiftUI

struct LabsScreen: View {
    @Binding var selection: Lab?
    
    var body: some View {
        List(Lab.allCases, selection: $selection) { lab in
            NavigationLink(lab.rawValue, value: NavigationDestination.labCalendar(lab))
        }
        .navigationTitle("Labs")
    }
}

#Preview {
    LabsScreen(selection: .constant(nil))
}
