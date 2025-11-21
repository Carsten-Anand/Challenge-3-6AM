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
    var filterOptions = ["All", "Visited", "Suggested", "Saved"]
    
    
    var filteredPlaces: [Place] {
        if searchText.isEmpty{
            if colourFilteredPlaces == "Visited"{
                return displayedPlaces.filter { place in
                    if place.status == .visited {
                        return true
                    } else {
                        return false
                    }
                }
            }
            else if colourFilteredPlaces == "Suggested"{
                return displayedPlaces.filter { place in
                    if place.status == .recommended {
                        return true
                    } else {
                        return false
                    }
                }
            }
            else if colourFilteredPlaces == "Saved" {
                return displayedPlaces.filter { place in
                    if place.status == .saved {
                        return true
                    } else {
                        return false
                    }
                }
            }
            else {
                return displayedPlaces
            }
        }
        else {
            if colourFilteredPlaces == "Visited" {
                return displayedPlaces.filter { place in
                    if place.status == .visited && place.name.localizedCaseInsensitiveContains(searchText){
                        return true
                    } else {
                        return false
                    }
                }
            }
            else if colourFilteredPlaces == "Suggested" {
                return displayedPlaces.filter { place in
                    if place.status == .recommended && place.name.localizedCaseInsensitiveContains(searchText){
                        return true
                    } else {
                        return false
                    }
                }
            }
            else if colourFilteredPlaces == "Saved" {
                return displayedPlaces.filter { place in
                    if place.status == .saved && place.name.localizedCaseInsensitiveContains(searchText){
                        return true
                    } else {
                        return false
                    }
                }
            }
            else {
                return displayedPlaces.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
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
                .padding(20)
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
                .navigationTitle("Places")
                .navigationBarTitleDisplayMode(.inline)
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
                            case "Recommended":
                                ContentUnavailableView(
                                    "No recommended places.",
                                    systemImage: "star.circle",
                                    description: Text("Recommended places will appear here.")
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
                                    description: Text("Pull to refresh or check back later for new places.")
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

#Preview {
    struct PreviewWrapper: View {
        @State var displayedPlaces: [Place] = convertCSVIntoArray().prefix(15).map { $0 }
        @State var showingPlacesView: Bool = true
        var body: some View {
            PlacesView(displayedPlaces: $displayedPlaces, showingPlacesView: $showingPlacesView)
        }
    }
    return PreviewWrapper()
}
