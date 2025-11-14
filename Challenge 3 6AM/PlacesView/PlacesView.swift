//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

// todo
// not all coordinates in string. right now only shows STYXX when clearly starts with another thing.

import SwiftUI

struct PlacesView : View {
    @State private var searchText: String = ""
    @State var places = convertCSVIntoArray()
    var body: some View {
        VStack{
            NavigationStack{
                    List{
                        ForEach(places){
                            item in NavigationLink(destination: DetailedPlacesView(data: item)){
                                Text(item.name)
                            }
                        }
                    }.listRowSpacing(10.0)
                    }.searchable(text: $searchText, placement: .navigationBarDrawer)
                .navigationTitle("Search for places")
                }
            }
        }

#Preview {
    PlacesView()
}
