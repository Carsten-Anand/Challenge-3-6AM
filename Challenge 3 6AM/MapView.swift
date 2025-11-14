//
//  MapView.swift
//  Challenge 3 6AM
//
//  Created by jenna on 10/11/25.
//


//todo
//when pin is clicked it should give moreinfosheet the name and it opens the place

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
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.3521_051, longitude: 103.822872), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
    
    @State private var place: Place? = nil
    
    let annotations = [
        Place(name: "bukit timah", coordinates: CLLocationCoordinate2D(latitude: 1.3548, longitude: 103.7763), region: .central, description: "Bukit Timah is one of Singapore’s greenest and most historic districts, best known for Bukit Timah Nature Reserve and the island’s highest hill. It offers rich biodiversity, forest trails, and challenging hikes for outdoor lovers. Beyond nature, the area features the Rail Corridor, charming cafés, and local eateries around Beauty World. Visitors can explore heritage spots, enjoy scenic viewpoints, cycle nearby park connectors, or unwind in quiet green spaces. ", markerTint: .yellow),
        Place(name: "mbs", coordinates: CLLocationCoordinate2D(latitude: 1.2838, longitude: 103.8591), region: .central, description: "Marina Bay Sands (MBS) is an iconic integrated resort known for its striking architecture and luxury experiences. Visitors can enjoy the SkyPark Observation Deck with panoramic city views, shop at high-end boutiques, dine at celebrity restaurants, and explore ArtScience Museum. At night, the waterfront area comes alive with light shows and vibrant city scenery.", markerTint: .green),
        Place(name: "woodlands stadium", coordinates: CLLocationCoordinate2D(latitude: 1.4352509353227207, longitude: 103.78029123839492), region: .north, description: "Woodlands Stadium is a community sports venue in the north of Singapore, known for its running track, football field, and open, spacious surroundings. Visitors can jog, train, or play field sports, and the nearby Sports Hall and swimming complex offer more activities.", markerTint: .blue)
    ]
    
    
    var body: some View {
        
        ZStack{
            Map(position: $position, selection: $place) {
                ForEach(annotations){
                    Marker($0.name, coordinate: $0.coordinates)
                        .tint(Color($0.markerTint))
                        .tag($0)
                }
            }
            .ignoresSafeArea()
            .onChange(of: place) { oldValue, newValue in
                print(newValue)
            }
        }
        .overlay(alignment: .topLeading){
            VStack(alignment: .leading){
                Text("Legend")
                    .padding()
                    .font(.headline)
                Label("Suggested", systemImage: "dot.circle.fill")
                    .font(.callout)
                    .foregroundStyle(.blue)
                    .padding()
                Label("Interested", systemImage: "dot.circle.fill")
                    .font(.headline)
                    .foregroundStyle(.yellow)
                    .padding()
                
            }
            .padding(3)
            .shadow(radius: 10)
            .glassEffect(.clear, in: .rect)
            .cornerRadius(25)
            .glassEffectTransition(.materialize)
        }
    }
}

#Preview {
    MapView()
}
