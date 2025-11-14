//
//  SwiftUIView.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 10/11/25.
//

import SwiftUI

struct DetailedPlacesView: View {
    
    var data: Place
    
    var body: some View {
        VStack {
            
            VStack(){}
                .navigationTitle(data.name)
            
            Image("sample photo")
                .resizable()
                .scaledToFit()
                .padding()
            ScrollView (.horizontal){
                HStack {
                    VStack{
                        Text("M")
//                        Text("")
                    }
                    VStack{
                        Text("T")
//                        Text
                    }
                    VStack{
                        Text("W")
//                        Text
                    }
                    VStack{
                        Text("T")
//                        Text
                    }
                    VStack{
                        Text("F")
//                        Text
                    }
                    VStack{
                        Text("S")
//                        Text
                    }
                    VStack{
                        Text("S")
                    }
                }
            }
            
            Text(data.description)
            
            Button {
                
            } label: {
                Text("Status updater")
            }
            

        }
    }
}

#Preview {
    NavigationStack{
        DetailedPlacesView(data: sampleData)
    }
}
