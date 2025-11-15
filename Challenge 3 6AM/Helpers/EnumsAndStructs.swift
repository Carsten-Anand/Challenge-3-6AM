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
//    static func == (lhs: Place, rhs: Place) -> Bool {
//        lhs.coordinates == rhs.coordinates
//    }
//    
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
    var region: RegionOptions
    let description: String
    var status: PlaceStatus // the user will change this
}

// regionoptions enum
enum RegionOptions{
    case north
    case northeast
    case central
    case west
    case east
}

// marker tint enum
enum markerTintColors {
    case blue
    case yellow
    case green
    
    var color: Color {
        switch self {
        case .blue: return .blue
        case .yellow: return .yellow
        case .green: return .green
        }
    }
}

// place status enum
enum PlaceStatus {
    case visited
    case recommended
    case saved
}

// status to markertint
func statusToTint(_ status: PlaceStatus) -> markerTintColors {
    switch status {
    case .visited:
        return .green
    case .recommended:
        return .blue
    case .saved:
        return .yellow
    }
}
