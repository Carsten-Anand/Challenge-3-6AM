//
//  CSVImporter.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

import SwiftCSV
import Foundation
import SwiftUI
import CoreLocation

// for my reference
// place struct
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
//    let markerTint: markerTintColors
//}
//
// regionoptions enum
//enum RegionOptions{
//    case north
//    case northeast
//    case central
//    case west
//    case east
//}
//
// markertint enum
//enum markerTintColors {
//    case blue
//    case yellow
//    case green
//}

// place status enum
//enum PlaceStatus {
//    case visited
//    case recommended
//    case saved
//}

// convert csv into array
func convertCSVIntoArray() -> [Place] { //this is a type; initialize place array
    var places = [Place]()
    
    //locate the file you want to use
    guard let filepath = Bundle.main.path(forResource: "places", ofType: "csv") else {
        print("File not found")
        return []
    }

    //convert that file into one long string
    var data = ""
    do {
        data = try String(contentsOfFile: filepath, encoding: String.Encoding.utf8)
    } catch {
        print(error)
        return []
    }

    //now split that string into an array of "rows" of data.  Each row is a string.
    var rows = data.components(separatedBy: "\n")

    //if you have a header row, remove it here
    rows.removeFirst()

    //now loop around each row, and split it into each of its columns
    for row in rows {
        let columns = row.components(separatedBy: ",")

        //check that we have enough columns
        if columns.count >= 6 {
            let name = columns[0]
            let latitude = columns[1]
            let longitude = columns[2]
            let regionString = columns[3].lowercased()
            let description = columns[4]
            let location = columns[5]
            
            // region
            let regionItem: RegionOptions
            if regionString == "north" {
                regionItem = .north
            } else if regionString == "northeast" {
                regionItem = .northeast
            } else if regionString == "central" {
                regionItem = .central
            } else if regionString == "west" {
                regionItem = .west
            } else if regionString == "east" {
                regionItem = .east
            } else {
                regionItem = .central
            }
            
            // coordinates
            let cleanedLatitude = Double(latitude.trimmingCharacters(in: CharacterSet(charactersIn: "\""))) ?? 0
            let cleanedLongitude = Double(longitude.trimmingCharacters(in: CharacterSet(charactersIn: "\""))) ?? 0
            let coordinateItem = CLLocationCoordinate2D(latitude: cleanedLatitude, longitude: cleanedLongitude)
            print("Latitude: \(cleanedLatitude), Longitude: \(cleanedLongitude)")
            
            // status
            let status: PlaceStatus = .recommended
            
            let place = Place(name: name, coordinates: coordinateItem, region: regionItem, description: description, status: status, location: location)
            places.append(place)
        }
        
    }
    return places
}

