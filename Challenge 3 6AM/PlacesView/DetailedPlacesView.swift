//
//  SwiftUIView.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 10/11/25.
//

import SwiftUI

struct DetailedPlacesView: View {
    @State var places = convertCSVIntoArray()
    var data: Place
    var body: some View {
        VStack {
            
            VStack(){}
                .navigationTitle(data.name)
            
            Image("sample photo")
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(data.description)
            
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
