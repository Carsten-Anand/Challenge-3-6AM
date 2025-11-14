//
//  SwiftUIView.swift
//  Challenge 3 6AM
//
//  Created by Carsten Anand on 10/11/25.
//

import SwiftUI


struct DetailedPlacesView: View {
    var location:String
    
    var body: some View {
        VStack{
            VStack(){
            }
            .navigationTitle(location)
            Image("sample photo")
                .resizable()
                .scaledToFit()
                .border(.black)
                .padding()
            
            
            
        }
    }
}

#Preview {
    NavigationStack{
        DetailedPlacesView(location:"@solaris")
    }
}
