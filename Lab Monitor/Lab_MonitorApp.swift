//
//  Lab_MonitorApp.swift
//  Lab Monitor
//
//  Created by James on 31/01/2024.
//

import SwiftUI

@main
struct Lab_MonitorApp: App {
    @State private var navigationModel = NavigationModel()
    @AppStorage("navigation") private var data: Data?
    
    var body: some Scene {
        WindowGroup {
//            NavigationStack(path: $navigationModel.path) {               
//                LabsScreen()
//                    .navigationDestination(for: NavigationDestination.self) { destination in
//                        switch (destination) {
//                        case .labCalendar(let lab):
//                            LabScreen(lab: lab)
//                        }
//                    }
//            }
            NavigationSplitView {
                LabsScreen(selection: $navigationModel.lab)
            } detail: {
                NavigationStack {
                    Group {
                        if let lab = navigationModel.lab {
                            LabScreen(lab: lab)
                        } else {
                            ContentUnavailableView("Select a lab", systemImage: "list.bullet")
                        }
                    }
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        switch (destination) {
                        case .labCalendar(let lab):
                            LabScreen(lab: lab)
                        }
                    }
                }
            }
            .onAppear {
                if let data = data {
                    if let decodedNav = try? JSONDecoder().decode(NavigationModel.self, from: data) {
                        navigationModel.path = decodedNav.path
                    }
                }
            }
            .onChange(of: navigationModel.path) {
                data = try? JSONEncoder().encode(navigationModel)
            }
        }
    }
}
