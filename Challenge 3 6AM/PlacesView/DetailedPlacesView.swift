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
                .navigationTitle(data.location)
            
            Image("sample photo")
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(data.description)

        }
    }
}

#Preview {
    NavigationStack{
        DetailedPlacesView(data: )
    }
}
