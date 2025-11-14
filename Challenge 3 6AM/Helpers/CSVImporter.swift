////
////  CSVImporter.swift
////  Challenge 3 6AM
////
////  Created by T Krobot on 10/11/25.
////
//
//import SwiftCSV
//import Foundation
//import SwiftUI
//import CoreLocation
//
//struct Place {
//    let id = UUID()
//    var name: String
//    var coordinates: CLLocationCoordinate2D
//    var region: String
//    var description: String
//    
//    static let sampleData = [
//        Place(name: "placeName", coordinates: CLLocationCoordinate2D(latitude: 1.3000, longitude: 2.4929), region: "sampleRegion", description: "sampleDesc")
//    ]
//}
//
//func convertCSVIntoArray() -> [Place] { //this is a type; initialize event array
//    var places = [Place]()
//    
//    //locate the file you want to use
//    guard let filepath = Bundle.main.path(forResource: "places", ofType: "csv") else {
//        print("File not found")
//        return []
//    }
//
//    //convert that file into one long string
//    var data = ""
//    do {
//        data = try String(contentsOfFile: filepath, encoding: String.Encoding.utf8)
//    } catch {
//        print(error)
//        return []
//    }
//
//    //now split that string into an array of "rows" of data.  Each row is a string.
//    var rows = data.components(separatedBy: "\n")
//
//    //if you have a header row, remove it here
//    rows.removeFirst()
//
//    //now loop around each row, and split it into each of its columns
//    for row in rows {
//        let columns = row.components(separatedBy: ",")
//
//        //check that we have enough columns
//        if columns.count == 4 {
//            let name = columns[0]
//            let coordinates = columns[1]
//            let region = columns[2]
//            let description = columns[3]
//            
//            let place = Place(name: name, coordinates: coordinates, region: region, description: description)
//            places.append(place)
//        }
//        
//    }
//    return places
//}
//
