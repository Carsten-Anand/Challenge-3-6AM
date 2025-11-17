//
//  EnumsAndStructs.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 14/11/25.
//

import SwiftUI
import MapKit
import UIKit
import SwiftData

// place struct
@Model class Place: Equatable {
    var name: String
    var coordinates: CLLocationCoordinate2D
    var region: RegionOptions
    var desc: String
    var status: PlaceStatus // the user will change this
    var markerTint: markerTintColors // this changes based on status
    var location: String
    var sortIndex: Int
    
    init(name: String, coordinates: CLLocationCoordinate2D, region: RegionOptions, description: String, status: PlaceStatus, markerTint: markerTintColors, location: String, sortIndex: Int) {
        self.name = name
        self.coordinates = coordinates
        self.region = region
        self.desc = description
        self.status = status
        self.markerTint = markerTint
        self.location = location
        self.sortIndex = sortIndex
    }
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
