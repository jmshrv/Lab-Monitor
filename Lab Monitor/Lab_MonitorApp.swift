//
//  Lab_MonitorApp.swift
//  Lab Monitor
//
//  Created by James on 31/01/2024.
//

import SwiftUI

@main
struct Lab_MonitorApp: App {
    @State var navigationPath: [NavigationDestination] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {               
                LabsScreen()
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        switch (destination) {
                        case .labCalendar(let lab):
                            LabTabScreen(lab: lab)
                        }
                    }
            }
        }
    }
}
