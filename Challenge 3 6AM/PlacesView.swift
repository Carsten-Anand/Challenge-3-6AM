//
//  PlacesView.swift
//  Challenge 3 6AM
//
//  Created by T Krobot on 10/11/25.
//

import SwiftUI

struct PlacesView : View {
    @State private var searchText: String = ""
    @State private var isPresented: Bool = false
    var body: some View {
        NavigationStack{
            ScrollView{
                
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer)
        .navigationTitle("Search for events")
    }
}

#Preview {
    PlacesView()
}
