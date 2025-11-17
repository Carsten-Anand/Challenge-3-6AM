//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

// todo
// add a refresh timer so they can only refresh once per day

import SwiftUI

struct PlacesView : View {
    @State private var searchText: String = ""
    @State var places = convertCSVIntoArray()
    @State private var displayedPlaces = [Place]()
    @Binding var showingPlacesView: Bool
    
    
    func refreshPlaces() {
        displayedPlaces = Array(places.shuffled().prefix(15))
    }
    
    var body: some View {
        NavigationStack {
            List($places, id: \.self, editActions: .delete) { place in
                Text(place.name)
            }
        }
        .listRowSpacing(10.0)
        .navigationTitle("Search for places")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    refreshPlaces()
                } label: {
                Image(systemName: "arrow.clockwise")
                }
                .buttonStyle(.glass)
            }
        }
        .onAppear {
            refreshPlaces()
        }
    }
}
        
//NavigationStack{
//            List(editActions:.delete){
//                ForEach(displayedPlaces){
//                    item in NavigationLink(destination: DetailedPlacesView(data: item)){
//                        Text(item.name)
//                    }
//                }

//#Preview {
//    PlacesView()
//}
