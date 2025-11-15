//
//  MapView.swift
//  Challenge 3 6AM
//
//  Created by jenna on 10/11/25.
//


//todo
//when pin is clicked it should give moreinfosheet the name and it opens the place

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
    @State private var showingLegendSheetView = false
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.3521_051, longitude: 103.822872), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
    
    @State private var place: Place? = nil
    @State var places = convertCSVIntoArray()
    
    
    var body: some View {
        ZStack{
            Map(position: $position, selection: $place) {
                ForEach(places){
                    Marker($0.name, coordinate: $0.coordinates)
                        .tint($0.markerTint.color)
                        .tag($0)
                }
            }
            .ignoresSafeArea()
            .onChange(of: place) { oldValue, newValue in
                print(newValue)
            }
        }
        .onAppear(){
            showingLegendSheetView = true
        }
        .sheet(isPresented: $showingLegendSheetView){
            LegendSheetView(showingLegendSheetView: $showingLegendSheetView)
                .presentationDetents([.fraction(0.4)])
        }
    }
}

#Preview {
    MapView()
}


//    let annotations = [
//        Place(name: "bukit timah", coordinates: CLLocationCoordinate2D(latitude: 1.3548, longitude: 103.7763), region: .central, description: "Bukit Timah is one of Singapore’s greenest and most historic districts, best known for Bukit Timah Nature Reserve and the island’s highest hill. It offers rich biodiversity, forest trails, and challenging hikes for outdoor lovers. Beyond nature, the area features the Rail Corridor, charming cafés, and local eateries around Beauty World. Visitors can explore heritage spots, enjoy scenic viewpoints, cycle nearby park connectors, or unwind in quiet green spaces. ", status: .recommended, markerTint: .yellow),
//        Place(name: "mbs", coordinates: CLLocationCoordinate2D(latitude: 1.2838, longitude: 103.8591), region: .central, description: "Marina Bay Sands (MBS) is an iconic integrated resort known for its striking architecture and luxury experiences. Visitors can enjoy the SkyPark Observation Deck with panoramic city views, shop at high-end boutiques, dine at celebrity restaurants, and explore ArtScience Museum. At night, the waterfront area comes alive with light shows and vibrant city scenery.", status: .visited, markerTint: .green),
//        Place(name: "woodlands stadium", coordinates: CLLocationCoordinate2D(latitude: 1.4352509353227207, longitude: 103.78029123839492), region: .north, description: "Woodlands Stadium is a community sports venue in the north of Singapore, known for its running track, football field, and open, spacious surroundings. Visitors can jog, train, or play field sports, and the nearby Sports Hall and swimming complex offer more activities.", status: .recommended, markerTint: .blue)
//    ]
