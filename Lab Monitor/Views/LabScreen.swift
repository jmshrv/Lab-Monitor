//
//  LabScreen.swift
//  Lab Monitor
//
//  Created by James on 06/02/2024.
//

import SwiftUI

struct LabScreen: View {
    let lab: Lab
    
    var body: some View {
        #if os(macOS)
        LabWeekScreen(lab: lab)
        #elseif os(iOS)
        LabTabScreen(lab: lab)
        #endif
    }
}

#Preview {
    LabScreen(lab: .a32)
}
