//
//  Sample data.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 14/11/25.
//

//struct Place: Identifiable, Equatable, Hashable {
//    static func == (lhs: Place, rhs: Place) -> Bool {
//        lhs.coordinates == rhs.coordinates
//    }
//    
//    let id = UUID()
//    let name: String
//    let coordinates: CLLocationCoordinate2D
//    var region: RegionOptions
//    let description: String
//    let markerTint: UIColor
//}
import MapKit

let sampleData = Place(name: "Solaris", coordinates: CLLocationCoordinate2D(latitude: 1.3548, longitude: 103.7763), region: .east, description: "learning coding",markerTint: .blue)
