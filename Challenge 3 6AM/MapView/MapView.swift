//
//  MapView.swift
//  Challenge 3 6AM
//
//  Created by jenna on 10/11/25.
//


import SwiftUI
import MapKit
import UIKit
import SwiftData

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

extension Place {
    var pinColor: Color {
        if isSaved { return .purple }
        if isVisited { return .green }
        if status == .recommended { return .blue }
        return .red
    }
}


struct MapView: View {
    private struct RegionToolbar: View {
        @Binding var mapCameraPosition: MapCameraPosition
        @Binding var selectedRegion: RegionOptions?
        var availableRegions: [RegionOptions]
        @State var toggle = false
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    if selectedRegion == nil {
                        Button {
                            selectedRegion = nil
                            toggle.toggle()
                            withAnimation{
                                mapCameraPosition = {
                                    let center = CLLocationCoordinate2D(latitude: 1.3521051, longitude: 103.822872)
                                    let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                                    let region = MKCoordinateRegion(center: center, span: span)
                                    return .region(region)
                                }()
                            }
                        }
                        
                        label: {
                            Text("All")
                        }
                        .buttonStyle(.glassProminent)
                    } else {
                        Button {
                            selectedRegion = nil
                            toggle.toggle()
                        }
                        label: {
                            Text("All")
                        }
                        .buttonStyle(.glass)
                    }
                    
                    
                    ForEach(availableRegions, id: \.self) { region in
                        if selectedRegion == region {
                            Button {
                                selectedRegion = region
                                toggle.toggle()
                            }
                            label: {
                                Text(region.rawValue.capitalized)
                            }
                            .buttonStyle(.glassProminent)
                        } else {
                            Button {
                                selectedRegion = region
                                toggle.toggle()
                            }
                            label: {
                                Text(region.rawValue.capitalized)
                            }
                            .buttonStyle(.glass)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
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
    
    @AppStorage("has_shown_legend_sheet_view") private var  hasShownLegendSheetView: Bool = false
    
    @State private var place: Place? = nil
    @Query private var places: [Place]
//    @State private var places: [Place] = convertCSVIntoArray()
    @State private var displayedPlaces: [Place] = []
    @State private var selectedRegion: RegionOptions? = nil
    
    @State private var showingPlacesView = false
    
    var body: some View {
        VStack {
            
            // Map
            ZStack(alignment: .top) {
                Map(position: $position, selection: $place) {
                    ForEach(displayedPlaces) { place in
                        Marker(place.name, coordinate: place.coordinates)
                            .tint(place.markerTint.color)
                            .tag(place)
                        
                    }
                }
                .ignoresSafeArea()
                
                // Toolbar
                RegionToolbar(
                    mapCameraPosition: $position,
                    selectedRegion: $selectedRegion,
                    availableRegions: Array(Set(places.map { $0.region })).sorted { $0.rawValue < $1.rawValue }
                )
                .onMapCameraChange (frequency: .continuous){ context in
                    print(context.region)
                }
                .onChange(of: selectedRegion) { _, newValue in
                    if let region = newValue {
                        self.displayedPlaces = self.places.filter { $0.region == region }
                    } else {
                        self.displayedPlaces = self.places
                    }
                }
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
            if !hasShownLegendSheetView{
                showingLegendSheetView = true
            }
        }
        .sheet(isPresented: $showingLegendSheetView){
            LegendSheetView(showingLegendSheetView: $showingLegendSheetView, hasShownLegendSheetView: $hasShownLegendSheetView)
                .presentationDetents([.fraction(0.28)])
        }
        .sheet(item: $place) { place in
            DetailedPlacesView(data: place)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        // places view
        .sheet(isPresented: $showingPlacesView) {
            PlacesView(displayedPlaces: $displayedPlaces, showingPlacesView: $showingPlacesView)
                .presentationDetents([.medium, .large, .fraction(0.2)])
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(.enabled)
        }
        
    }
}


#Preview {
    MapView()
}
