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
    var data: Place
    
    var body: some View {
        NavigationStack{
            VStack {
                
                Text(data.location)
                
                Image("sample photo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Text(data.desc)
                    .padding()
                Button {
                    
                } label: {
                    Text("Status updater")
                        .padding(.init(top: 10, leading: 20, bottom: 10, trailing: 20))
                    //                    .background(Capsule().fill(Color.blue.opacity(0.4)))
                    
                }.buttonStyle(.glass)
                
                
            }.navigationTitle(data.name)
        }
    }
}
#Preview {
    DetailedPlacesView(data: sampleData[0])
}
