//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

// todo
// add a refresh timer so they can only refresh once per day
import SwiftUI
import SwiftData

struct PlacesView: View {
    @State private var searchText: String = ""
    @Query private var places: [Place]
//    @State private var places = convertCSVIntoArray()
    @Binding var displayedPlaces: [Place]
    @Binding var showingPlacesView: Bool
    @State private var colourFilteredPlaces = "All"
    
    var filterOptions = ["For You", "Visited", "Saved"]
    
    
    var filteredPlaces: [Place] {
        var base = displayedPlaces
        
        // --- State filters ---
        switch colourFilteredPlaces {
        case "Visited":
            base = base.filter { $0.isVisited }
        case "Saved":
            base = base.filter { $0.isSaved }
        case "For You":
            base = base.filter { $0.status == .recommended }
        default:
            break
        }
        
        // --- Search filtering ---
        if !searchText.isEmpty {
            base = base.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        return base
    }
    
    
    func refreshPlaces() {
        displayedPlaces = Array(places.shuffled().prefix(15))
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                VStack {
                    Picker("Filter", selection: $colourFilteredPlaces) {
                        ForEach(filterOptions, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    
                    List {
                        ForEach(filteredPlaces) { place in
                            NavigationLink(destination: DetailedPlacesView(data: place)) {
                                Text(place.name)
                            }
                        }
                        .onDelete { indexSet in
                            displayedPlaces.remove(atOffsets: indexSet)
                        }
                    }
                    .listRowSpacing(10)
                    .navigationTitle("Places")
                    .navigationBarTitleDisplayMode(.inline)
                    
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            Button {
//                                refreshPlaces()
//                            } label: {
//                                Image(systemName: "arrow.clockwise")
//                            }
//                            .buttonStyle(.glass)
//                        }
//                    }
                    
                    .searchable(text: $searchText, placement: .navigationBarDrawer)
                    
                    
                    // ContentUnavailableView
                    .overlay {
                        if filteredPlaces.isEmpty {
                            if !searchText.isEmpty {
                                ContentUnavailableView.search(text: searchText)
                            } else {
                                switch colourFilteredPlaces {
                                case "Visited":
                                    ContentUnavailableView(
                                        "No visited places.",
                                        systemImage: "mappin.circle",
                                        description: Text("Places you've visited will appear here.")
                                    )
                                    
                                case "For You":
                                    ContentUnavailableView(
                                        "No suggested places.",
                                        systemImage: "star.circle",
                                        description: Text("Suggested places will appear here.")
                                    )
                                    
                                case "Saved":
                                    ContentUnavailableView(
                                        "No saved places.",
                                        systemImage: "bookmark",
                                        description: Text("You haven't saved any places yet.")
                                    )
                                    
                                default:
                                    ContentUnavailableView(
                                        "No places available.",
                                        systemImage: "mappin.and.ellipse",
                                        description: Text("Pull to refresh or check back later.")
                                    )
                                }
                            }
                        }
                    }
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
}

#Preview {
    MapView()
}
