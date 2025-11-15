//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

// todo
//

import SwiftUI

struct PlacesView : View {
    @State private var searchText: String = ""
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
                }
            }
        }

#Preview {
    PlacesView()
}
