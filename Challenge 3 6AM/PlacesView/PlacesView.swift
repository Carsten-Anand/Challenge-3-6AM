//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

// todo
//

import SwiftUI

//struct PlacesView : View {
//    @State private var searchText: String = ""
//    let places = ["Cat Cafe", "Bugis Library", "Jurong Regional Library"]
//    var body: some View {
//        VStack{
//            NavigationStack{
//                    List{
//                        ForEach(places, id: \.self){
//                            item in NavigationLink(destination: DetailedPlacesView(data: sampleData)){
//                                Text(item)
//                            }
//                        }
//                    }.listRowSpacing(10.0)
//                    }.searchable(text: $searchText, placement: .navigationBarDrawer)
//                .navigationTitle("Search for places")
//                }
//            }
//        }
//
//#Preview {
//    PlacesView()
//}

struct PlacesView: View {
    @State private var searchText: String = ""
<<<<<<< HEAD
    var places: Place
    let suggestedPlaces = places.filter { place in
        if places.markerTint = .green
    }
    
    var showSuggested = true
    var showInterested = true
    var showAccepted = true
    var body: some View {
        VStack{
            HStack{
                Button{
                    
                }label: {
                    
                }
                Button{
                    
                }label: {
                    
=======
    @State var places = convertCSVIntoArray()
    var body: some View {
        VStack{
            NavigationStack{
                    List{
                        ForEach(places.shuffled().prefix(5)){
                            item in NavigationLink(destination: DetailedPlacesView(data: item)){
                                Text(item.name)
                            }
                        }
                    }.listRowSpacing(10.0)
                    }.searchable(text: $searchText, placement: .navigationBarDrawer)
                .navigationTitle("Search for places")
>>>>>>> main
                }
                Button{
                    
                }label: {
                    
                }
            }
            
            NavigationStack{
                
            }
        }
    }
}
