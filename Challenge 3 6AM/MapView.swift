//
//  MapView.swift
//  Challenge 3 6AM
//
//  Created by jenna on 10/11/25.
//


//todo
//change colour of pins
//make pins interactive

import SwiftUI
import MapKit
import UIKit

enum RegionOptions{
    case North
    case Northeast
    case Central
    case West
    case East
}

enum StatusOptions{
    case Suggested
    case Interested
    case Completed
}

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
    var region: RegionOptions
    let description: String
    var status: StatusOptions
    
}

struct MapView: View {
    @State private var area = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 1.3521_051, longitude: 103.822872), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let annotations = [
        Place(name: "bukit timah", coordinates: CLLocationCoordinate2D(latitude: 1.3548, longitude: 103.7763), region: .Central, description: "Bukit Timah is one of Singapore’s greenest and most historic districts, best known for Bukit Timah Nature Reserve and the island’s highest hill. It offers rich biodiversity, forest trails, and challenging hikes for outdoor lovers. Beyond nature, the area features the Rail Corridor, charming cafés, and local eateries around Beauty World. Visitors can explore heritage spots, enjoy scenic viewpoints, cycle nearby park connectors, or unwind in quiet green spaces. " , status:.Suggested),
        Place(name: "mbs", coordinates: CLLocationCoordinate2D(latitude: 1.2838, longitude: 103.8591), region: .Central, description: "Marina Bay Sands (MBS) is an iconic integrated resort known for its striking architecture and luxury experiences. Visitors can enjoy the SkyPark Observation Deck with panoramic city views, shop at high-end boutiques, dine at celebrity restaurants, and explore ArtScience Museum. At night, the waterfront area comes alive with light shows and vibrant city scenery.", status: .Suggested),
        Place(name: "woodlands stadium", coordinates: CLLocationCoordinate2D(latitude: 1.4352509353227207, longitude: 103.78029123839492), region: .North, description: "Woodlands Stadium is a community sports venue in the north of Singapore, known for its running track, football field, and open, spacious surroundings. Visitors can jog, train, or play field sports, and the nearby Sports Hall and swimming complex offer more activities.", status: .Suggested)
    ]
    
    
    var body: some View {
        
        ZStack{
            Map(coordinateRegion: $area, annotationItems: annotations) {
                MapPin(coordinate: $0.coordinates, )
            }
        }
        .overlay(alignment: .topLeading){
            VStack{
//                Spacer()
                HStack{
//                    Spacer()
                    VStack(alignment: .leading){
                        Text("Legend")
                            .padding()
                            .font(.title)
                        Label("Suggested", systemImage: "dot.circle.fill")
                            .font(.headline)
                            .foregroundStyle(.blue)
                            .padding()
                        Label("Interested", systemImage: "dot.circle.fill")
                            .font(.headline)
                            .foregroundStyle(.yellow)
                            .padding()
                        
                    }
                 //   .background(.ultraThinMaterial)
                    .opacity(0.7)
                    .cornerRadius(20)
                    .shadow(radius: 10)
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
                }
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
//                Spacer()
            }
            
            
           
            
        }
        
    }
}

#Preview {
    MapView()
}
