//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

// todo
// add a refresh timer so they can only refresh once per day

import SwiftUI

struct PlacesView: View {
    @State private var searchText: String = ""
    @State private var places = convertCSVIntoArray()
    @Binding var displayedPlaces: [Place]
    @Binding var showingPlacesView: Bool
    @State private var colourFilteredPlaces = "All"
    var filterOptions = ["All", "Visited", "Reccomended", "Saved"]
    
    
    var filteredPlaces: [Place] {
        if searchText.isEmpty {
            return displayedPlaces
        } else {
            return displayedPlaces.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func refreshPlaces() {
        displayedPlaces = Array(places.shuffled().prefix(15))
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                Picker("Filter", selection: $colourFilteredPlaces) {
                    ForEach(filterOptions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                List {
                    ForEach(filteredPlaces) { place in
                        NavigationLink(destination: DetailedPlacesView(data: place)) {
                            Text(place.name)
                        }
                    }
                    .onDelete { indexSet in
                        // delete from the displayed list (not the master CSV list)
                        displayedPlaces.remove(atOffsets: indexSet)
                    }
                }
                .listRowSpacing(10.0)
                .navigationTitle("Search for places")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            refreshPlaces()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                        }
                        .buttonStyle(.glass)
                    }
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
            }
        }
        .interactiveDismissDisabled()
        .onAppear {
            if displayedPlaces.isEmpty {
                refreshPlaces()
            }
        }
    }
}

