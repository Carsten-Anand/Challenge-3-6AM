//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct PlacesView : View {
    @State private var searchText: String = ""
    let places = ["Cat Cafe", "Bugis Library", "Jurong Regional Library"]
    var body: some View {
        VStack{
            NavigationStack{
                    List{
                        ForEach(places, id: \.self){
                            item in NavigationLink(destination: DetailedPlacesView(location: item, description: String)){
                                Text(item)
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
