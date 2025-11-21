//
//  MapView.swift
//  Challenge 3 6AM
//
//  Created by jenna on 10/11/25.
//


//todo
//when pin is clicked it should give moreinfosheet the name and it opens the place
// make it so that it only shows the 15 items that places view has

// sindya
// hi i added a status to the example events, and i changed up enums for the event colours a bit. because it wasnt really translating to colour.

import SwiftUI
import MapKit
import UIKit

extension CLLocationCoordinate2D: @retroactive Equatable {}
extension CLLocationCoordinate2D: @retroactive Hashable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}

struct MapView: View {
    private struct RegionToolbar: View {
        @Binding var selectedRegion: RegionOptions?
        var availableRegions: [RegionOptions]

        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {

                    Button(action: { selectedRegion = nil }) {
                        Text("All")
                            .font(.headline)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(
                                GlassBackground(isSelected: selectedRegion == nil)
                            )
                    }

                    ForEach(availableRegions, id: \.self) { region in
                        Button(action: { selectedRegion = region }) {
                            Text(region.rawValue.capitalized)
                                .font(.headline)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(
                                    GlassBackground(isSelected: selectedRegion == region)
                                )
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
        }
    }

    // Liquid Glass / Glassmorphic background
    struct GlassBackground: View {
        var isSelected: Bool

        var body: some View {
            ZStack {
                // Frosted glass
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.ultraThinMaterial) // iOS 15+ glass effect
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isSelected ? Color.blue.opacity(0.8) : Color.white.opacity(0.3), lineWidth: isSelected ? 2 : 1)
                    )
                    .shadow(color: isSelected ? Color.blue.opacity(0.3) : Color.black.opacity(0.1), radius: isSelected ? 6 : 3, x: 0, y: 2)
            }
        }
    }

    
    @State private var showingLegendSheetView = false
    @State private var position: MapCameraPosition = {
        let center = CLLocationCoordinate2D(latitude: 1.3521051, longitude: 103.822872)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: center, span: span)
        return .region(region)
    }()
    
    @State private var place: Place? = nil
    @State private var places: [Place] = convertCSVIntoArray()
    @State private var displayedPlaces: [Place] = []
    @State private var selectedRegion: RegionOptions? = nil
    
    @State private var showingPlacesView = false
    
    var body: some View {
        VStack {
            // Toolbar
            RegionToolbar(
                selectedRegion: $selectedRegion,
                availableRegions: Array(Set(places.map { $0.region })).sorted { $0.rawValue < $1.rawValue }
            )
                .onChange(of: selectedRegion) { _, newValue in
                    if let region = newValue {
                        self.displayedPlaces = self.places.filter { $0.region == region }
                    } else {
                        self.displayedPlaces = self.places
                    }
                }

            // Map
            ZStack {
                Map(position: $position, selection: $place) {
                    ForEach(displayedPlaces) { place in
                        Marker(place.name, coordinate: place.coordinates)
                            .tint(place.markerTint.color)
                            .tag(place)
                    }
                }
                .ignoresSafeArea()
            }
        }
        .onAppear {
            showingLegendSheetView = true
            showingPlacesView = true
            if let selected = selectedRegion {
                displayedPlaces = places.filter { $0.region == selected }
            } else {
                displayedPlaces = places
            }
        }
        .sheet(isPresented: $showingLegendSheetView){
            LegendSheetView(showingLegendSheetView: $showingLegendSheetView)
            .presentationDetents([.fraction(0.4)])
        }
        .sheet(item: $place) { place in
            DetailedPlacesView(data: place)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        // places view
        .sheet(isPresented: $showingPlacesView) {
            PlacesView(displayedPlaces: $displayedPlaces, showingPlacesView: $showingPlacesView)
                .presentationDetents([.medium, .large, .fraction(0.3)])
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(.enabled)
        }
    }
}

#Preview {
    MapView()
}
