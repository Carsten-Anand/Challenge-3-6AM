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


let sampleData = [
    Place(name: "bukit timah", coordinates: CLLocationCoordinate2D(latitude: 1.3548, longitude: 103.7763), region: .central, description: "Bukit Timah is one of Singapore’s greenest and most historic districts, best known for Bukit Timah Nature Reserve and the island’s highest hill. It offers rich biodiversity, forest trails, and challenging hikes for outdoor lovers. Beyond nature, the area features the Rail Corridor, charming cafés, and local eateries around Beauty World. Visitors can explore heritage spots, enjoy scenic viewpoints, cycle nearby park connectors, or unwind in quiet green spaces. ",status: .recommended, markerTint: .blue, location: "bukit timah"),
    Place(name: "mbs", coordinates: CLLocationCoordinate2D(latitude: 1.2838, longitude: 103.8591), region: .central, description: "Marina Bay Sands (MBS) is an iconic integrated resort known for its striking architecture and luxury experiences. Visitors can enjoy the SkyPark Observation Deck with panoramic city views, shop at high-end boutiques, dine at celebrity restaurants, and explore ArtScience Museum. At night, the waterfront area comes alive with light shows and vibrant city scenery.",status: .saved, markerTint: .yellow, location: "marina bay"),
    Place(name: "woodlands stadium", coordinates: CLLocationCoordinate2D(latitude: 1.4352509353227207, longitude: 103.78029123839492), region: .north, description: "Woodlands Stadium is a community sports venue in the north of Singapore, known for its running track, football field, and open, spacious surroundings. Visitors can jog, train, or play field sports, and the nearby Sports Hall and swimming complex offer more activities.", status: .visited, markerTint: .green, location: "woodlands")
]
