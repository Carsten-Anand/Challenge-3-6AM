//
//  EnumsAndStructs.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 14/11/25.
//

import SwiftUI
import MapKit
import UIKit

// place struct
struct Place: Identifiable, Equatable, Hashable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.coordinates == rhs.coordinates
    }
    
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
    var region: RegionOptions
    let description: String
    let markerTint: markerTint
}

// regionoptions enum
enum RegionOptions{
    case north
    case northeast
    case central
    case west
    case east
}

// markertint enum
enum markerTint {
    case blue
    case yellow
    case green
}
