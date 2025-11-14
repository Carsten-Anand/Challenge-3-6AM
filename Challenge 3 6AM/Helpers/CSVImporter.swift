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

func convertCSVIntoArray() -> [Place] { //this is a type; initialize placeitem array
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
        if columns.count == 4 {
            let name = columns[0]
            let coordinates = columns[1]
            let regionString = columns[2].lowercased()
            let description = columns[3]
            
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
            }
            
            // coordinates
            let components = coordinates.split(separator: ",")
            var coordinateItem = CLLocationCoordinate2D(latitude: 0, longitude: 0) // default value
            if components.count == 2 {
                let latitude = Double(components[0]) ?? 0
                let longitude = Double(components[1]) ?? 0
                coordinateItem = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            }
            
            let place = Place(name: name, coordinates: coordinateItem, region: regionItem, description: description, markerTint: markertint)
            places.append(place)
        }
        
    }
    return places
}

