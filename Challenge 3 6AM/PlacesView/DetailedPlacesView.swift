//
//  SwiftUIView.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 10/11/25.
//

import SwiftUI
import SwiftData

struct DetailedPlacesView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Place.sortIndex) var places: [Place]
//    @State var places = convertCSVIntoArray()
    
    var data: Place
    var body: some View {
        VStack {
            
            VStack(){}
                .navigationTitle(data.name)
            
            Text(data.location)
            
            Image("sample photo")
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(data.desc)
            Button {
                
            } label: {
                Text("Status updater")
                    .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
//                    .background(Capsule().fill(Color.blue.opacity(0.4)))
                
            }.buttonStyle(.glass)
            
            

        }
    }
}

#Preview {
    NavigationStack{
        DetailedPlacesView(data: sampleData[0])
    }
}
