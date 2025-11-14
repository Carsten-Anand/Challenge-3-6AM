//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct PlacesView : View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack{
            List{
                Text("Place1")
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer)
        .navigationTitle("Search for events")
    }
}

#Preview {
    PlacesView()
}
