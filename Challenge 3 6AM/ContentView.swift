//
//  ContentView.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 7/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        MapView()
            .onAppear {
                let places = convertCSVIntoArray()
                for place in places {
                    modelContext.insert(place)
                }
            }
    }
    // loop through places
    // insert each place into model context
}

#Preview {
    ContentView()
}
