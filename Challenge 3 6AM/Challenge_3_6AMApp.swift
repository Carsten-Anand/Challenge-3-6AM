//
//  Challenge_3_6AMApp.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 7/11/25.
//

import SwiftUI
import SwiftData

@main
struct Challenge_3_6AMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Place.self)
    }
}

